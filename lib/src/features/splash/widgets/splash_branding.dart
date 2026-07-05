import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';

const _vesselUrl = 'https://www.vessellabs.ng';

/// Shared splash layout: logo, tagline, and Vessel footer.
class SplashBranding extends StatelessWidget {
  const SplashBranding({
    super.key,
    this.logoOpacity = 1,
    this.logoScale = 1,
    this.taglineOpacity = 1,
    this.taglineSlide = 0,
    this.footerOpacity = 1,
    this.pulseScale = 1,
    this.showPulse = false,
  });

  final double logoOpacity;
  final double logoScale;
  final double taglineOpacity;
  final double taglineSlide;
  final double footerOpacity;
  final double pulseScale;
  final bool showPulse;

  Future<void> _openVesselSite() async {
    final uri = Uri.parse(_vesselUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: AppDesignTokens.loginBackgroundGradient(colorScheme),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDesignTokens.containerPadding,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 120,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (showPulse)
                              Transform.scale(
                                scale: pulseScale,
                                child: Container(
                                  width: 112,
                                  height: 112,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colorScheme.primary.withValues(
                                      alpha: 0.08,
                                    ),
                                  ),
                                ),
                              ),
                            Opacity(
                              opacity: logoOpacity,
                              child: Transform.scale(
                                scale: logoScale,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppDesignTokens.radiusMd,
                                    ),
                                    boxShadow: context.cardShadow,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      AppDesignTokens.radiusMd,
                                    ),
                                    child: Image.asset(
                                      'assets/imsh.png',
                                      height: 88,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(AppDesignTokens.spacingLg),
                      Transform.translate(
                        offset: Offset(0, taglineSlide),
                        child: Opacity(
                          opacity: taglineOpacity,
                          child: Text(
                            'Experience unique patient care',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: footerOpacity,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: AppDesignTokens.spacingLg,
                ),
                child: _PoweredByVessel(onTap: _openVesselSite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PoweredByVessel extends StatelessWidget {
  const _PoweredByVessel({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Powered by',
            style: theme.textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppDesignTokens.spacingSm),
          Image.asset(
            'assets/vessellogo.png',
            height: 20,
            errorBuilder: (_, __, ___) => Text(
              'Vessel',
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
