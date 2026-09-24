import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/patient_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';

/// Compact clinical home header: solid icon + greeting.
class HomePageHeader extends ConsumerWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final patient = ref.watch(currentPatientProvider);
    final name = patient?.displayFirstName ?? 'there';

    return Row(
      children: [
        const ImshSolidIcon(
          icon: Icons.home_outlined,
          color: ImshAccentColors.indigo,
          size: 34,
          iconSize: 18,
          radius: AppDesignTokens.radiusMd,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImshEllipsisText(
                text: '${timeBasedGreeting()}, $name',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: cs.onSurface,
                ),
              ),
              ImshEllipsisText(
                text: 'Your daily health summary from Ibom Specialist.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// @deprecated Prefer [HomePageHeader]. Kept for skeleton placeholders.
class HomeGreeting extends ConsumerWidget {
  const HomeGreeting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const HomePageHeader();
  }
}
