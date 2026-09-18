import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../helper/date_formatter.dart';
import '../../../models/medical_records_dashboard_model.dart';

Future<Uint8List> buildDiagnosesPdf({
  required String patientName,
  String? hospitalNumber,
  required List<DashboardDiagnosis> diagnoses,
}) async {
  final logo = await _loadLogo();
  final now = DateTime.now();
  final doc = pw.Document();

  doc.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(40, 36, 40, 42),
      header: (context) {
        if (context.pageNumber == 1) return pw.SizedBox();
        return pw.Container(
          padding: const pw.EdgeInsets.only(bottom: 10),
          decoration: const pw.BoxDecoration(
            border: pw.Border(
              bottom: pw.BorderSide(color: PdfColor.fromInt(0xFFD6DEE8)),
            ),
          ),
          child: pw.Text(
            'Past diagnoses · $patientName',
            style: pw.TextStyle(
              fontSize: 9,
              color: PdfColor.fromInt(0xFF5B6B7A),
            ),
          ),
        );
      },
      footer: (context) => pw.Container(
        alignment: pw.Alignment.centerRight,
        padding: const pw.EdgeInsets.only(top: 12),
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
                    'Past diagnoses summary',
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
        pw.SizedBox(height: 18),
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: pw.BoxDecoration(
            color: PdfColor.fromInt(0xFF0B3D5C),
            borderRadius: pw.BorderRadius.circular(8),
          ),
          child: pw.Text(
            'CLINICAL DIAGNOSIS RECORD',
            style: pw.TextStyle(
              color: PdfColors.white,
              fontSize: 11,
              fontWeight: pw.FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
        ),
        pw.SizedBox(height: 14),
        pw.Row(
          children: [
            pw.Expanded(child: _kv('Patient', patientName)),
            pw.SizedBox(width: 16),
            pw.Expanded(child: _kv('Hospital no.', hospitalNumber ?? '—')),
          ],
        ),
        pw.SizedBox(height: 16),
        if (diagnoses.isEmpty)
          pw.Text(
            'No diagnoses on file.',
            style: const pw.TextStyle(fontSize: 11),
          )
        else
          pw.Table(
            border: pw.TableBorder.all(
              color: PdfColor.fromInt(0xFFD6DEE8),
              width: 0.6,
            ),
            columnWidths: {
              0: const pw.FlexColumnWidth(2.4),
              1: const pw.FlexColumnWidth(0.9),
              2: const pw.FlexColumnWidth(1.6),
              3: const pw.FlexColumnWidth(1.1),
            },
            children: [
              pw.TableRow(
                decoration: const pw.BoxDecoration(
                  color: PdfColor.fromInt(0xFFEEF3F7),
                ),
                children: [
                  _th('Diagnosis'),
                  _th('ICD'),
                  _th('Doctor'),
                  _th('Date'),
                ],
              ),
              for (final diagnosis in diagnoses)
                pw.TableRow(
                  children: [
                    _td(
                      diagnosis.title.isNotEmpty
                          ? diagnosis.title
                          : 'Diagnosis',
                    ),
                    _td(
                      diagnosis.icdCode?.trim().isNotEmpty == true
                          ? diagnosis.icdCode!
                          : '—',
                    ),
                    _td(
                      diagnosis.doctorName.isNotEmpty
                          ? diagnosis.doctorName
                          : '—',
                    ),
                    _td(
                      diagnosis.diagnosedAt == null
                          ? '—'
                          : DateFormatter.medicalDate(diagnosis.diagnosedAt!),
                    ),
                  ],
                ),
            ],
          ),
      ],
    ),
  );

  return Uint8List.fromList(await doc.save());
}

pw.Widget _kv(String label, String value) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        label.toUpperCase(),
        style: pw.TextStyle(
          fontSize: 8,
          letterSpacing: 0.6,
          color: PdfColor.fromInt(0xFF8A96A3),
          fontWeight: pw.FontWeight.bold,
        ),
      ),
      pw.SizedBox(height: 3),
      pw.Text(
        value,
        style: pw.TextStyle(
          fontSize: 12,
          fontWeight: pw.FontWeight.bold,
          color: PdfColor.fromInt(0xFF0B3D5C),
        ),
      ),
    ],
  );
}

pw.Widget _th(String text) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 7),
    child: pw.Text(
      text,
      style: pw.TextStyle(
        fontSize: 8.5,
        fontWeight: pw.FontWeight.bold,
        color: PdfColor.fromInt(0xFF0B3D5C),
      ),
    ),
  );
}

pw.Widget _td(String text) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 7),
    child: pw.Text(text, style: const pw.TextStyle(fontSize: 9)),
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
