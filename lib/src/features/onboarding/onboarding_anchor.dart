import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/connectivity_provider.dart';
import '../../providers/family_provider.dart';
import 'onboarding_tips.dart';

/// Marks [child] as the hole for [tip] and asks to show that tip once.
class OnboardingAnchor extends ConsumerStatefulWidget {
  const OnboardingAnchor({
    super.key,
    required this.tip,
    required this.child,
    this.enabled = true,
    this.deferWhileViewingFamily = false,
  });

  final OnboardingTip tip;
  final Widget child;
  final bool enabled;

  /// Home and check-in wait while the family banner is on screen.
  final bool deferWhileViewingFamily;

  @override
  ConsumerState<OnboardingAnchor> createState() => _OnboardingAnchorState();
}

class _OnboardingAnchorState extends ConsumerState<OnboardingAnchor> {
  bool _claimed = false;
  bool _posted = false;
  int _retries = 0;
  ScrollPosition? _scrollPosition;
  VoidCallback? _scrollListener;
  late final OnboardingTipsNotifier _tips;

  @override
  void initState() {
    super.initState();
    _tips = ref.read(onboardingTipsProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _applyActive(_isActive());
    });
  }

  @override
  void didUpdateWidget(covariant OnboardingAnchor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled ||
        oldWidget.tip != widget.tip ||
        oldWidget.deferWhileViewingFamily != widget.deferWhileViewingFamily) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _applyActive(_isActive());
      });
    }
  }

  @override
  void dispose() {
    _clearScroll();
    final tip = widget.tip;
    final claimed = _claimed;
    _release();
    if (claimed) {
      _tips.anchorUnmounted(tip);
    }
    super.dispose();
  }

  bool _isActive() {
    if (!widget.enabled || ref.read(isOfflineProvider)) return false;
    if (widget.deferWhileViewingFamily &&
        ref.read(familyViewProvider).isViewingFamily) {
      return false;
    }
    return true;
  }

  void _applyActive(bool active) {
    if (!mounted) return;
    if (active && _claimed) {
      _scheduleRequest();
      return;
    }
    if (!active && !_claimed) return;

    if (active) {
      if (!OnboardingFocus.tryClaim(widget.tip)) return;
      setState(() => _claimed = true);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _scheduleRequest();
      });
      return;
    }

    final tip = widget.tip;
    _release();
    setState(() {});
    ref.read(onboardingTipsProvider.notifier).anchorUnmounted(tip);
  }

  void _release() {
    if (!_claimed) return;
    OnboardingFocus.release(widget.tip);
    _claimed = false;
  }

  void _scheduleRequest() {
    if (!_claimed || !mounted) return;
    final tips = ref.read(onboardingTipsProvider);
    if (!tips.loaded ||
        tips.seen.contains(widget.tip) ||
        tips.shownThisSession ||
        tips.pending != null) {
      return;
    }
    if (tips.suppressThisLaunch && !tips.replay) return;
    if (_posted) return;
    _posted = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _posted = false;
      if (!mounted || !_claimed || !_isActive()) return;
      if (!_targetIsVisible()) {
        final route = ModalRoute.of(context);
        final onStage =
            TickerMode.valuesOf(context).enabled &&
            (route == null || route.isCurrent);
        if (!onStage) return;
        if (_retries < 8) {
          _retries += 1;
          _scheduleRequest();
        } else {
          _armScrollRetry();
        }
        return;
      }
      _clearScroll();
      _retries = 0;
      ref.read(onboardingTipsProvider.notifier).request(widget.tip);
    });
  }

  bool _targetIsVisible() {
    if (!TickerMode.valuesOf(context).enabled) return false;
    final route = ModalRoute.of(context);
    if (route != null && !route.isCurrent) return false;
    final object = OnboardingFocus.of(widget.tip).context?.findRenderObject();
    if (object is! RenderBox || !object.attached || !object.hasSize) {
      return false;
    }
    if (object.size.width < 8 || object.size.height < 8) return false;
    final rect = object.localToGlobal(Offset.zero) & object.size;
    final screen = Offset.zero & MediaQuery.sizeOf(context);
    if (!rect.overlaps(screen)) return false;
    final visible = rect.intersect(screen);
    return visible.width >= 8 && visible.height >= 8;
  }

  void _armScrollRetry() {
    if (_scrollListener != null) return;
    final position = Scrollable.maybeOf(context)?.position;
    if (position == null) return;
    void onScroll() {
      if (!mounted) {
        _clearScroll();
        return;
      }
      if (!_targetIsVisible()) return;
      _clearScroll();
      _retries = 0;
      _scheduleRequest();
    }

    _scrollPosition = position;
    _scrollListener = onScroll;
    position.addListener(onScroll);
  }

  void _clearScroll() {
    final position = _scrollPosition;
    final listener = _scrollListener;
    if (position != null && listener != null) {
      position.removeListener(listener);
    }
    _scrollPosition = null;
    _scrollListener = null;
  }

  void _queueApply() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _applyActive(_isActive());
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(isOfflineProvider, (previous, next) => _queueApply());
    ref.listen(familyViewProvider, (previous, next) {
      if (!widget.deferWhileViewingFamily) return;
      _queueApply();
    });
    ref.listen(onboardingTipsProvider, (previous, next) {
      if (!next.loaded || next.pending != null || next.shownThisSession) {
        return;
      }
      if (next.seen.contains(widget.tip)) return;
      if (next.suppressThisLaunch && !next.replay) return;
      _queueApply();
    });

    if (!_claimed) return widget.child;
    return Focus(
      focusNode: OnboardingFocus.of(widget.tip),
      canRequestFocus: false,
      skipTraversal: true,
      includeSemantics: false,
      child: widget.child,
    );
  }
}
