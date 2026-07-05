import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/appointment_model.dart';
import 'consultation_history_item.dart';

class ConsultationHistorySection extends StatelessWidget {
  const ConsultationHistorySection({
    super.key,
    required this.items,
    required this.onViewAll,
    required this.onItemTap,
  });

  final List<ConsultationHistoryItem> items;
  final VoidCallback onViewAll;
  final void Function(ConsultationHistoryItem item) onItemTap;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'CONSULTATION HISTORY',
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: onViewAll,
              child: const Text('View All'),
            ),
          ],
        ),
        const Gap(AppDesignTokens.spacingSm),
        ...items.map(
          (item) => ConsultationHistoryTile(
            item: item,
            onTap: () => onItemTap(item),
          ),
        ),
      ],
    );
  }
}
