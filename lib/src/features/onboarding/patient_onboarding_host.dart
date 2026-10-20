import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';

import '../../core/theme/app_design_tokens.dart';
import 'onboarding_tips.dart';

/// Wraps the navigator so each tip can spotlight a widget on any route.
///
/// [MaterialApp.router]'s builder sits above the navigator, so this host
/// supplies the [Overlay] that [Onboarding.showWithSteps] inserts into.
class PatientOnboardingHost extends ConsumerStatefulWidget {
  const PatientOnboardingHost({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<PatientOnboardingHost> createState() =>
      _PatientOnboardingHostState();
}

class _PatientOnboardingHostState extends ConsumerState<PatientOnboardingHost> {
  final GlobalKey<OnboardingState> _onboardingKey =
      GlobalKey<OnboardingState>();
  late final OverlayEntry _contentEntry = OverlayEntry(
    builder: _buildOnboarding,
  );

  @override
  void didUpdateWidget(covariant PatientOnboardingHost oldWidget) {
    super.didUpdateWidget(oldWidget);
    _contentEntry.markNeedsBuild();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(onboardingTipsProvider, (previous, next) {
      if (previous?.forceHide != next.forceHide) {
        final onboarding = _onboardingKey.currentState;
        if (onboarding != null && onboarding.isVisible()) {
          onboarding.hide();
        }
      }
      final tip = next.pending;
      if (tip == null || tip == previous?.pending) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (ref.read(onboardingTipsProvider).pending != tip) return;
        final onboarding = _onboardingKey.currentState;
        if (onboarding == null || onboarding.isVisible()) return;
        onboarding.showWithSteps(tip.index, <int>[tip.index]);
      });
    });

    return Overlay(initialEntries: [_contentEntry]);
  }

  Widget _buildOnboarding(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final theme = Theme.of(context);

    return Onboarding(
      key: _onboardingKey,
      globalOnboarding: true,
      autoSizeTexts: false,
      duration: reduceMotion
          ? Duration.zero
          : const Duration(milliseconds: 280),
      steps: [
        for (final tip in OnboardingTip.values)
          _step(theme, tip, reduceMotion: reduceMotion),
      ],
      onEnd: (index) {
        if (index < 0 || index >= OnboardingTip.values.length) return;
        ref
            .read(onboardingTipsProvider.notifier)
            .complete(OnboardingTip.values[index]);
      },
      child: widget.child,
    );
  }

  OnboardingStep _step(
    ThemeData theme,
    OnboardingTip tip, {
    required bool reduceMotion,
  }) {
    final colorScheme = theme.colorScheme;
    final onCard = colorScheme.onSurface;
    return OnboardingStep(
      focusNode: OnboardingFocus.of(tip),
      titleText: tip.title,
      bodyText: tip.body,
      titleTextStyle: theme.textTheme.titleSmall?.copyWith(
        color: onCard,
        fontWeight: FontWeight.w800,
      ),
      bodyTextStyle: theme.textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      titleTextColor: onCard,
      bodyTextColor: colorScheme.onSurfaceVariant,
      fullscreen: true,
      hasLabelBox: false,
      hasArrow: false,
      showPulseAnimation: false,
      animateOverlayHole: !reduceMotion,
      overlayBehavior: HitTestBehavior.opaque,
      overlayColor: const Color(0x8C000000),
      shape: tip == OnboardingTip.home
          ? const CircleBorder()
          : const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
      margin: EdgeInsets.all(tip == OnboardingTip.home ? 10 : 4),
      labelBoxPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTapCallback: (TapArea area, VoidCallback next, VoidCallback close) {
        if (area == TapArea.overlay || area == TapArea.hole) {
          close();
        }
      },
      stepBuilder: (BuildContext context, OnboardingStepRenderInfo info) {
        final scheme = Theme.of(context).colorScheme;
        return Semantics(
          container: true,
          explicitChildNodes: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Material(
                  color: scheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppDesignTokens.radiusMd,
                      ),
                      border: Border.all(color: scheme.outlineVariant),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(info.titleText, style: info.titleStyle),
                          const SizedBox(height: 6),
                          Text(info.bodyText, style: info.bodyStyle),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: const Size(88, 44),
                              ),
                              onPressed: info.close,
                              child: const Text('Got it'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Clears seen tips and brings Home forward so the welcome tip can show.
void replayPatientOnboarding(BuildContext context, WidgetRef ref) {
  ref.read(onboardingTipsProvider.notifier).replay();
  final tabs =
      TabsRouterScope.of(context)?.controller ??
      context.router.root.innerRouterOf<TabsRouter>(PatientShellRoute.name);
  if (tabs != null && tabs.homeIndex != -1) {
    tabs.setActiveIndex(tabs.homeIndex);
  }
  if (context.router.current.name != PatientShellRoute.name) {
    context.router.popUntilRouteWithName(PatientShellRoute.name);
  }
}
