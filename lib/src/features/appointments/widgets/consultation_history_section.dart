import 'package:flutter/material.dart';

import '../../../core/theme/imsh_accent_colors.dart';
import '../../../models/appointment_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImshSectionHeader(
          title: 'Consultation history',
          icon: Icons.history_outlined,
          iconColor: ImshAccentColors.indigo,
          trailing: TextButton(
            onPressed: onViewAll,
            style: TextButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('View all'),
          ),
        ),
        const SizedBox(height: 8),
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) const SizedBox(height: 8),
          ConsultationHistoryTile(
            item: items[i],
            onTap: () => onItemTap(items[i]),
          ),
        ],
      ],
    );
  }
}
