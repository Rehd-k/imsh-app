import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/responsive.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import '../../providers/auth_provider.dart';
import '../../providers/lab_results_provider.dart';
import 'widgets/lab_result_detail_sections.dart';
import 'widgets/lab_results_body.dart';

@RoutePage()
class LabResultsScreen extends ConsumerWidget {
  const LabResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: ImshAppBar(title: Text('Lab results')),
      body: LabResultsBody(),
    );
  }
}

@RoutePage()
class LabResultDetailScreen extends ConsumerWidget {
  const LabResultDetailScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(labResultDetailProvider(id));

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Lab result')),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ImshErrorPanel(
          message: authFlowErrorMessage(error),
          onRetry: () => ref.invalidate(labResultDetailProvider(id)),
        ),
        data: (detail) => ResponsiveBody(
          expand: false,
          builder: (context, bp) => SingleChildScrollView(
            child: LabResultDetailSections(detail: detail),
          ),
        ),
      ),
    );
  }
}
