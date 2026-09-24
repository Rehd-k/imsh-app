import 'package:flutter/material.dart';

import '../../../models/medical_record_model.dart';
import '../../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../../shared/widgets/imsh_semantic_badge.dart';

class EncounterStatusBadge extends StatelessWidget {
  const EncounterStatusBadge({super.key, required this.status});

  final EncounterStatus status;

  @override
  Widget build(BuildContext context) {
    final tone = switch (status) {
      EncounterStatus.completed => ImshSemanticTone.success,
      EncounterStatus.ongoing => ImshSemanticTone.warning,
      EncounterStatus.cancelled => ImshSemanticTone.error,
    };

    return ImshEllipsisChip(
      label: status.label,
      tone: tone,
      maxWidth: 120,
    );
  }
}
