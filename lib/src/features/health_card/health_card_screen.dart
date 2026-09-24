import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../core/responsive.dart';
import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../core/utils/user_error_message.dart';
import '../../models/health_card_model.dart';
import '../../providers/health_card_provider.dart';
import '../../shared/widgets/imsh_empty_state.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import '../../shared/widgets/imsh_page_header.dart';
import '../../shared/widgets/imsh_semantic_badge.dart';
import '../../shared/widgets/imsh_solid_icon.dart';
import '../../shared/widgets/imsh_surface_card.dart';

@RoutePage()
class HealthCardScreen extends ConsumerWidget {
  const HealthCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(healthCardProvider);
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Health card'),
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ImshErrorPanel(
          message: userFacingErrorMessage(error),
          onRetry: () => ref.invalidate(healthCardProvider),
          tips: isNetworkRelatedError(error) ? networkErrorTips : const [],
        ),
        data: (card) => ResponsiveBody(
          expand: false,
          maxWidth: 480,
          builder: (context, bp) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ImshPageHeader(
                    title: 'Health card',
                    subtitle:
                        'Show this at frontdesk, pharmacy, lab, and the ward.',
                    icon: Icons.qr_code_2_rounded,
                    iconColor: ImshAccentColors.indigo,
                  ),
                  const Gap(12),
                  _HealthPassCard(card: card),
                  const Gap(12),
                  ImshSurfaceCard(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const ImshSolidIcon(
                          icon: Icons.wb_sunny_outlined,
                          color: ImshAccentColors.amber,
                          size: 32,
                          iconSize: 16,
                          radius: 8,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Turn up brightness for easier scanning.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Text(
                    'This is not a national ID.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HealthPassCard extends StatelessWidget {
  const _HealthPassCard({required this.card});

  final HealthCardData card;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final hasAllergies =
        card.allergies != '—' && card.allergies.trim().isNotEmpty;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const ImshSolidIcon(
                icon: Icons.local_hospital_outlined,
                color: ImshAccentColors.blue,
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
                      text: 'Ibom Specialist Hospital',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const ImshSemanticBadge(
                      label: 'PATIENT',
                      tone: ImshSemanticTone.info,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(14),
          Text(
            card.patientName,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: cs.onSurface,
            ),
          ),
          const Gap(12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _FactChip(
                label: 'ID',
                value: card.patientId,
                accent: ImshAccentColors.blue,
              ),
              _FactChip(
                label: 'Card',
                value: card.cardNo,
                accent: ImshAccentColors.teal,
              ),
              _FactChip(
                label: 'DOB',
                value: card.dobLabel,
                accent: ImshAccentColors.purple,
              ),
              _FactChip(
                label: 'Blood',
                value: card.bloodType,
                accent: ImshAccentColors.pink,
              ),
              _FactChip(
                label: 'HMO',
                value: card.hmo,
                accent: ImshAccentColors.green,
              ),
              _FactChip(
                label: 'Allergies',
                value: card.allergies,
                accent: hasAllergies
                    ? ImshAccentColors.amber
                    : ImshAccentColors.indigo,
                emphasize: hasAllergies,
              ),
            ],
          ),
          const Gap(16),
          Center(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
                border: Border.all(color: cs.outlineVariant),
              ),
              child: QrImageView(
                data: card.qrPayload,
                version: QrVersions.auto,
                size: 200,
                backgroundColor: Colors.white,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Color(0xFF191C1E),
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: Color(0xFF191C1E),
                ),
                errorStateBuilder: (context, _) => const SizedBox(
                  width: 200,
                  height: 200,
                  child: ImshEmptyState(
                    message: 'Unable to render QR code.',
                    icon: Icons.qr_code_2_outlined,
                    iconColor: ImshAccentColors.amber,
                  ),
                ),
              ),
            ),
          ),
          const Gap(10),
          Text(
            'Show this at frontdesk, pharmacy, lab, and the ward.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: cs.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _FactChip extends StatelessWidget {
  const _FactChip({
    required this.label,
    required this.value,
    required this.accent,
    this.emphasize = false,
  });

  final String label;
  final String value;
  final Color accent;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: emphasize
            ? accent.withValues(alpha: 0.12)
            : cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
        border: Border.all(
          color: emphasize ? accent.withValues(alpha: 0.45) : cs.outlineVariant,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: accent,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: cs.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ImshEllipsisText(
                  text: value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: cs.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
