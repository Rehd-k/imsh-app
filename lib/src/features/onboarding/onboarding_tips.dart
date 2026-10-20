import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/app_timezone.dart';
import '../../models/appointment_model.dart';
import '../../models/medication_model.dart';

/// Tips that teach one non-obvious action. Each is shown at most once,
/// and only one automatic tip is shown per app launch.
enum OnboardingTip { home, checkIn, dose, family }

const onboardingTipPriority = <OnboardingTip>[
  OnboardingTip.home,
  OnboardingTip.checkIn,
  OnboardingTip.dose,
  OnboardingTip.family,
];

extension OnboardingTipCopy on OnboardingTip {
  String get title => switch (this) {
    OnboardingTip.home => 'Home',
    OnboardingTip.checkIn => 'Self check-in',
    OnboardingTip.dose => 'Mark a dose',
    OnboardingTip.family => 'Viewing a family member',
  };

  String get body => switch (this) {
    OnboardingTip.home =>
      'Appointments, results, and bills are here. The other tabs are Records, Booking, Billing, and Account.',
    OnboardingTip.checkIn =>
      'This visit is today. Use Self check-in on Home when you arrive.',
    OnboardingTip.dose =>
          'Tap when you\'ve taken it. You can undo if you tap by mistake.',
    OnboardingTip.family =>
      'Everything on screen is theirs until you tap Back to me.',
  };
}

/// True when [appointment] is an in-person visit scheduled for today in Lagos.
bool appointmentIsTodayInPerson(AppointmentSummary appointment) {
  if (appointment.visitType != AppointmentVisitType.inPerson) return false;
  if (appointment.status == AppointmentStatus.cancelled ||
      appointment.status == AppointmentStatus.completed) {
    return false;
  }
  final today = AppTimezone.now();
  final local = AppTimezone.toLocal(appointment.scheduledAt);
  return local.year == today.year &&
      local.month == today.month &&
      local.day == today.day;
}

/// True when a dose can be marked taken right now.
bool doseQualifiesForOnboarding({
  required MedicationDoseStatus status,
  required DateTime scheduledAt,
  required bool pendingMark,
}) {
  if (pendingMark || status == MedicationDoseStatus.taken) return false;
  if (status == MedicationDoseStatus.missed) return true;
  if (status != MedicationDoseStatus.upcoming) return false;
  final localScheduled = AppTimezone.toLocal(scheduledAt);
  return !localScheduled.isAfter(
    DateTime.now().add(const Duration(minutes: 5)),
  );
}

/// Focus targets shared by the shell, home, medications, and the family banner.
abstract final class OnboardingFocus {
  static final Map<OnboardingTip, FocusNode> _nodes =
      <OnboardingTip, FocusNode>{};

  /// Created on first use so the binding already exists.
  static FocusNode of(OnboardingTip tip) {
    return _nodes.putIfAbsent(
      tip,
      () => FocusNode(
        debugLabel: 'onboarding-${tip.name}',
        skipTraversal: true,
        canRequestFocus: false,
      ),
    );
  }

  static final Map<OnboardingTip, int> _claims = {
    for (final tip in OnboardingTip.values) tip: 0,
  };

  static bool tryClaim(OnboardingTip tip) {
    if (_claims[tip]! > 0) return false;
    _claims[tip] = 1;
    return true;
  }

  static void release(OnboardingTip tip) {
    _claims[tip] = 0;
  }
}

class OnboardingTipsState {
  const OnboardingTipsState({
    this.loaded = false,
    this.seen = const <OnboardingTip>{},
    this.suppressThisLaunch = false,
    this.replay = false,
    this.shownThisSession = false,
    this.pending,
    this.forceHide = 0,
  });

  final bool loaded;
  final Set<OnboardingTip> seen;
  final bool suppressThisLaunch;
  final bool replay;
  final bool shownThisSession;
  final OnboardingTip? pending;
  final int forceHide;

  static const _keep = Object();

  OnboardingTipsState copyWith({
    bool? loaded,
    Set<OnboardingTip>? seen,
    bool? suppressThisLaunch,
    bool? replay,
    bool? shownThisSession,
    Object? pending = _keep,
    int? forceHide,
  }) {
    return OnboardingTipsState(
      loaded: loaded ?? this.loaded,
      seen: seen ?? this.seen,
      suppressThisLaunch: suppressThisLaunch ?? this.suppressThisLaunch,
      replay: replay ?? this.replay,
      shownThisSession: shownThisSession ?? this.shownThisSession,
      pending: identical(pending, _keep)
          ? this.pending
          : pending as OnboardingTip?,
      forceHide: forceHide ?? this.forceHide,
    );
  }
}

const _seenKey = 'imsh_onboarding_seen_v1';

class OnboardingTipsNotifier extends Notifier<OnboardingTipsState> {
  final Set<OnboardingTip> _queue = <OnboardingTip>{};
  bool _flushQueued = false;
  int _epoch = 0;

  @override
  OnboardingTipsState build() {
    Future<void>.microtask(_load);
    return const OnboardingTipsState();
  }

  Future<void> _load() async {
    final epoch = _epoch;
    final prefs = await SharedPreferences.getInstance();
    if (!ref.mounted || epoch != _epoch || state.loaded) return;
    final raw = prefs.getStringList(_seenKey) ?? const <String>[];
    final seen = <OnboardingTip>{};
    for (final name in raw) {
      for (final tip in OnboardingTip.values) {
        if (tip.name == name) seen.add(tip);
      }
    }
    state = state.copyWith(loaded: true, seen: seen);
  }

  bool _eligible(OnboardingTip tip) {
    if (!state.loaded || state.seen.contains(tip)) return false;
    if (state.shownThisSession || state.pending != null) return false;
    if (state.suppressThisLaunch && !state.replay) return false;
    return true;
  }

  /// Ask to show [tip] on the next frame. The highest-priority request wins.
  void request(OnboardingTip tip) {
    if (!_eligible(tip)) return;
    _queue.add(tip);
    if (_flushQueued) return;
    _flushQueued = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _flushQueued = false;
      if (!ref.mounted) return;
      final queued = Set<OnboardingTip>.of(_queue);
      _queue.clear();
      if (state.pending != null || state.shownThisSession) return;
      for (final candidate in onboardingTipPriority) {
        if (queued.contains(candidate) && _eligible(candidate)) {
          state = state.copyWith(pending: candidate);
          return;
        }
      }
    });
  }

  Future<void> complete(OnboardingTip tip) async {
    if (state.seen.contains(tip) && state.pending != tip) return;
    final seen = <OnboardingTip>{...state.seen, tip};
    state = state.copyWith(
      seen: seen,
      pending: null,
      shownThisSession: true,
      replay: false,
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_seenKey, seen.map((item) => item.name).toList());
  }

  /// The anchored widget left the screen while its tip was up.
  ///
  /// Hides the overlay without marking the tip seen, so it can show next launch.
  /// Deferred because the anchor calls this from [State.dispose].
  void anchorUnmounted(OnboardingTip tip) {
    Future<void>(() {
      if (!ref.mounted || state.pending != tip) return;
      state = state.copyWith(
        pending: null,
        shownThisSession: true,
        replay: false,
        forceHide: state.forceHide + 1,
      );
    });
  }

  /// A push opened a task. Do not teach over it this launch.
  void suppressThisLaunch() {
    final hide = state.pending != null;
    state = state.copyWith(
      suppressThisLaunch: true,
      replay: false,
      pending: null,
      forceHide: hide ? state.forceHide + 1 : state.forceHide,
    );
  }

  Future<void> replay() async {
    _epoch++;
    state = state.copyWith(
      loaded: true,
      seen: const <OnboardingTip>{},
      suppressThisLaunch: false,
      replay: true,
      shownThisSession: false,
      pending: null,
      forceHide: state.forceHide + 1,
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_seenKey);
  }
}

final onboardingTipsProvider =
    NotifierProvider<OnboardingTipsNotifier, OnboardingTipsState>(
      OnboardingTipsNotifier.new,
    );
