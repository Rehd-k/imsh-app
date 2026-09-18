import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../helper/date_formatter.dart';
import '../../../models/radiology_report_model.dart';

Future<Uint8List> buildRadiologyReportPdf(RadiologyReportDetail detail) async {
  final logo = await _loadLogo();
  final now = DateTime.now();
  final doc = pw.Document();

  doc.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(40, 36, 40, 42),
      footer: (context) => pw.Align(
        alignment: pw.Alignment.centerRight,
        child: pw.Text(
          'Generated ${DateFormatter.medicalDate(now)}  ·  Page ${context.pageNumber} of ${context.pagesCount}',
          style: pw.TextStyle(fontSize: 8, color: PdfColor.fromInt(0xFF8A96A3)),
        ),
      ),
      build: (context) => [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            if (logo != null)
              pw.Container(
                width: 52,
                height: 52,
                margin: const pw.EdgeInsets.only(right: 14),
                child: pw.Image(logo, fit: pw.BoxFit.contain),
              ),
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Ibom Multispecialty Hospital',
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromInt(0xFF0B3D5C),
                    ),
                  ),
                  pw.SizedBox(height: 2),
                  pw.Text(
                    'Radiology · Imaging report',
                    style: pw.TextStyle(
                      fontSize: 11,
                      color: PdfColor.fromInt(0xFF5B6B7A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 16),
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: pw.BoxDecoration(
            color: PdfColor.fromInt(0xFF0B3D5C),
            borderRadius: pw.BorderRadius.circular(8),
          ),
          child: pw.Text(
            'IMAGING REPORT',
            style: pw.TextStyle(
              color: PdfColors.white,
              fontSize: 11,
              fontWeight: pw.FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
        ),
        pw.SizedBox(height: 16),
        pw.Text(
          detail.displayTitle,
          style: pw.TextStyle(
            fontSize: 15,
            fontWeight: pw.FontWeight.bold,
            color: PdfColor.fromInt(0xFF0B3D5C),
          ),
        ),
        pw.SizedBox(height: 12),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: _card('STUDY', [
                _line('Modality', detail.modality.label),
                _line(
                  'Performed',
                  DateFormatter.medicalDate(detail.performedAt),
                ),
                _line('Status', detail.status.label),
              ]),
            ),
            pw.SizedBox(width: 12),
            pw.Expanded(
              child: _card('CLINICIANS', [
                _line('Radiologist', detail.radiologistName),
                _line('Referring doctor', detail.referringDoctorName),
                if (detail.verifiedAt != null)
                  _line(
                    'Verified',
                    DateFormatter.medicalDate(detail.verifiedAt!),
                  ),
              ]),
            ),
          ],
        ),
        if (detail.findings?.trim().isNotEmpty == true) ...[
          pw.SizedBox(height: 16),
          _section('Findings', detail.findings!),
        ],
        if (detail.impression?.trim().isNotEmpty == true) ...[
          pw.SizedBox(height: 12),
          _section('Impression', detail.impression!),
        ],
        if (detail.recommendations?.trim().isNotEmpty == true) ...[
          pw.SizedBox(height: 12),
          _section('Recommendations', detail.recommendations!),
        ],
        if (detail.reportBody?.trim().isNotEmpty == true) ...[
          pw.SizedBox(height: 12),
          _section('Report', detail.reportBody!),
        ],
      ],
    ),
  );

  return Uint8List.fromList(await doc.save());
}

pw.Widget _card(String title, List<pw.Widget> children) {
  return pw.Container(
    padding: const pw.EdgeInsets.all(10),
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColor.fromInt(0xFFD6DEE8)),
      borderRadius: pw.BorderRadius.circular(8),
    ),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 8,
            letterSpacing: 0.7,
            fontWeight: pw.FontWeight.bold,
            color: PdfColor.fromInt(0xFF8A96A3),
          ),
        ),
        pw.SizedBox(height: 8),
        ...children,
      ],
    ),
  );
}

pw.Widget _line(String label, String value) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 6),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(fontSize: 8, color: PdfColor.fromInt(0xFF8A96A3)),
        ),
        pw.Text(
          value,
          style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
        ),
      ],
    ),
  );
}

pw.Widget _section(String title, String body) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        title.toUpperCase(),
        style: pw.TextStyle(
          fontSize: 9,
          fontWeight: pw.FontWeight.bold,
          letterSpacing: 0.7,
          color: PdfColor.fromInt(0xFF0B3D5C),
        ),
      ),
      pw.SizedBox(height: 6),
      pw.Text(body, style: const pw.TextStyle(fontSize: 10.5, lineSpacing: 2)),
    ],
  );
}

Future<pw.MemoryImage?> _loadLogo() async {
  try {
    final bytes = await rootBundle.load('assets/imsh.png');
    return pw.MemoryImage(bytes.buffer.asUint8List());
  } catch (_) {
    return null;
  }
}
