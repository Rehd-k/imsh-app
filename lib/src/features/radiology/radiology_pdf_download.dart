import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../../models/radiology_report_model.dart';
import '../../services/radiology_service.dart';
import 'pdf/radiology_report_pdf.dart';

Future<void> downloadRadiologyReportPdf(
  BuildContext context, {
  required RadiologyService service,
  required String reportId,
  RadiologyReportDetail? detail,
}) async {
  try {
    final report = detail ?? await service.getRadiologyReport(reportId);
    if (report.paymentRequired) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Complete payment to download this report.'),
        ),
      );
      return;
    }
    final bytes = await buildRadiologyReportPdf(report);
    await Printing.sharePdf(
      bytes: bytes,
      filename: 'radiology-report-${report.id}.pdf',
    );
  } catch (e) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Could not download PDF: $e')));
  }
}
