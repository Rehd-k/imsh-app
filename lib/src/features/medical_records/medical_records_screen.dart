import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/responsive.dart';
import '../../providers/auth_provider.dart';
import '../../providers/medical_records_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import 'widgets/encounter_detail_sections.dart';
import 'widgets/medical_records_body.dart';

@RoutePage()
class MedicalRecordsScreen extends ConsumerWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: ImshAppBar(
        title: Text('Ibom Specialist'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
      body: MedicalRecordsBody(),
    );
  }
}

@RoutePage()
class EncounterDetailScreen extends ConsumerWidget {
  const EncounterDetailScreen({super.key, @PathParam('id') required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final encounterAsync = ref.watch(encounterDetailProvider(id));

    return Scaffold(
      appBar: const ImshAppBar(title: Text('Medical record')),
      body: encounterAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ImshErrorPanel(
          message: authFlowErrorMessage(error),
          onRetry: () => ref.invalidate(encounterDetailProvider(id)),
        ),
        data: (encounter) => ResponsiveBody(
          expand: false,
          bottomPadding: 24,
          builder: (context, bp) => SingleChildScrollView(
            child: EncounterDetailSections(encounter: encounter),
          ),
        ),
      ),
    );
  }
}
