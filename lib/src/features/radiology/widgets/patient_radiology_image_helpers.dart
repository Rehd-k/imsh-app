import '../../../models/radiology_report_model.dart';

bool radiologyMimeIsGeneric(String? mimeType) {
  final mime = mimeType?.toLowerCase().trim() ?? '';
  return mime.isEmpty || mime == 'application/octet-stream';
}

bool radiologyImageIsLikelyPdf(RadiologyReportImage image) {
  final mime = image.mimeType?.toLowerCase() ?? '';
  if (!radiologyMimeIsGeneric(mime) && mime.contains('pdf')) return true;
  return image.fileName.toLowerCase().endsWith('.pdf');
}

bool radiologyImageIsLikelyRaster(RadiologyReportImage image) {
  if (radiologyImageIsLikelyPdf(image)) return false;
  final mime = image.mimeType?.toLowerCase() ?? '';
  if (!radiologyMimeIsGeneric(mime) &&
      mime.startsWith('image/') &&
      !mime.contains('svg')) {
    return true;
  }
  final name = image.fileName.toLowerCase();
  return name.endsWith('.jpg') ||
      name.endsWith('.jpeg') ||
      name.endsWith('.png') ||
      name.endsWith('.gif') ||
      name.endsWith('.webp') ||
      name.endsWith('.bmp') ||
      name.endsWith('.tif') ||
      name.endsWith('.tiff');
}

String radiologyImageUploadedLabel(RadiologyReportImage image) {
  final mime = image.mimeType ?? 'file';
  return '$mime · ${image.uploadedAt.toIso8601String()}';
}
