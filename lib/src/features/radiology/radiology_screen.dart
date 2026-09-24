import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/responsive.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import '../../providers/auth_provider.dart';
import '../../providers/radiology_reports_provider.dart';
import 'widgets/radiology_report_detail_sections.dart';
import 'widgets/radiology_reports_body.dart';

@RoutePage()
class RadiologyReportsScreen extends ConsumerWidget {
  const RadiologyReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: ImshAppBar(title: Text('Radiology reports')),
      body: RadiologyReportsBody(),
    );
  }
}

@RoutePage()
class RadiologyDetailScreen extends ConsumerWidget {
  const RadiologyDetailScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(radiologyReportDetailProvider(id));

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Radiology report')),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ImshErrorPanel(
          message: authFlowErrorMessage(error),
          onRetry: () => ref.invalidate(radiologyReportDetailProvider(id)),
        ),
        data: (detail) => ResponsiveBody(
          expand: false,
          builder: (context, bp) => SingleChildScrollView(
            child: RadiologyReportDetailSections(detail: detail),
          ),
        ),
      ),
    );
  }
}
