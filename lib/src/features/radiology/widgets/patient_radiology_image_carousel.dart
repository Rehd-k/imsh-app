import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../../../models/radiology_report_model.dart';
import '../../../services/radiology_service.dart';
import 'patient_radiology_image_helpers.dart';

Future<Uint8List> loadPatientRadiologyImageBytes(
  RadiologyService service,
  String reportId,
  String imageId,
) {
  return service.getRadiologyImageBytes(reportId, imageId);
}

Future<void> savePatientRadiologyImageBytes(
  BuildContext context, {
  required RadiologyReportImage image,
  required Uint8List bytes,
}) async {
  final fileName = image.fileName.trim().isNotEmpty
      ? image.fileName.trim()
      : 'radiology_${image.id}';
  if (radiologyImageIsLikelyPdf(image)) {
    await Printing.sharePdf(bytes: bytes, filename: fileName);
    return;
  }
  final saved = await FilePicker.platform.saveFile(
    fileName: fileName,
    bytes: bytes,
  );
  if (!context.mounted) return;
  if (saved != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Saved $fileName')),
    );
  }
}

void showPatientRadiologyImageExpanded(
  BuildContext context, {
  required RadiologyReportImage image,
  required Uint8List bytes,
}) {
  final isPdf = radiologyImageIsLikelyPdf(image);
  final isRaster = radiologyImageIsLikelyRaster(image);
  showDialog<void>(
    context: context,
    builder: (ctx) {
      final size = MediaQuery.sizeOf(ctx);
      return Dialog(
        insetPadding: const EdgeInsets.all(16),
        child: SizedBox(
          width: size.width * 0.92,
          height: size.height * 0.88,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 4, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        image.fileName,
                        style: Theme.of(ctx).textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (!isPdf && !isRaster)
                      TextButton.icon(
                        onPressed: () => savePatientRadiologyImageBytes(
                          ctx,
                          image: image,
                          bytes: bytes,
                        ),
                        icon: const Icon(Icons.save_alt_outlined, size: 18),
                        label: const Text('Save'),
                      ),
                    IconButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: isPdf
                    ? PdfPreview(
                        build: (_) async => bytes,
                        canChangePageFormat: false,
                        canChangeOrientation: false,
                        pdfFileName: image.fileName,
                      )
                    : isRaster
                        ? InteractiveViewer(
                            minScale: 0.5,
                            maxScale: 4,
                            child: Center(
                              child: Image.memory(bytes, fit: BoxFit.contain),
                            ),
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.insert_drive_file_outlined,
                                    size: 64,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'This file type cannot be previewed in the app.',
                                    style: Theme.of(ctx).textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                  FilledButton.icon(
                                    onPressed: () =>
                                        savePatientRadiologyImageBytes(
                                      ctx,
                                      image: image,
                                      bytes: bytes,
                                    ),
                                    icon: const Icon(Icons.save_alt_outlined),
                                    label: const Text('Save file'),
                                  ),
                                ],
                              ),
                            ),
                          ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class PatientRadiologyImageSlide extends StatefulWidget {
  const PatientRadiologyImageSlide({
    super.key,
    required this.service,
    required this.reportId,
    required this.image,
    this.showHeader = true,
    this.maxPreviewHeight = 240,
    this.compact = false,
  });

  final RadiologyService service;
  final String reportId;
  final RadiologyReportImage image;
  final bool showHeader;
  final double maxPreviewHeight;
  final bool compact;

  @override
  State<PatientRadiologyImageSlide> createState() =>
      _PatientRadiologyImageSlideState();
}

class _PatientRadiologyImageSlideState extends State<PatientRadiologyImageSlide> {
  Future<Uint8List>? _bytesFuture;

  @override
  void initState() {
    super.initState();
    _bytesFuture = loadPatientRadiologyImageBytes(
      widget.service,
      widget.reportId,
      widget.image.id,
    );
  }

  @override
  void didUpdateWidget(covariant PatientRadiologyImageSlide oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.image.id != widget.image.id) {
      _bytesFuture = loadPatientRadiologyImageBytes(
        widget.service,
        widget.reportId,
        widget.image.id,
      );
    }
  }

  void _onTap(BuildContext context, Uint8List bytes) {
    showPatientRadiologyImageExpanded(
      context,
      image: widget.image,
      bytes: bytes,
    );
  }

  String? get _subtitle {
    if (!widget.showHeader) return null;
    return radiologyImageUploadedLabel(widget.image);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPdf = radiologyImageIsLikelyPdf(widget.image);
    final isRaster = radiologyImageIsLikelyRaster(widget.image);

    final content = FutureBuilder<Uint8List>(
      future: _bytesFuture,
      builder: (context, snap) {
        if (snap.hasError) {
          return _slideError(theme, 'Could not load file.\n${snap.error}');
        }
        if (!snap.hasData) {
          return _slideLoading(theme);
        }
        final bytes = snap.data!;

        if (isPdf) {
          return _buildPdfPreview(theme, bytes);
        }
        if (isRaster) {
          return _buildRasterPreview(theme, bytes);
        }
        return _buildUnknownPreview(theme, bytes);
      },
    );

    if (widget.compact) {
      return content;
    }
    return Card(
      clipBehavior: Clip.antiAlias,
      child: content,
    );
  }

  Widget _slideLoading(ThemeData theme) {
    if (widget.compact) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListTile(
      leading: const SizedBox(
        width: 28,
        height: 28,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      title: Text(widget.image.fileName),
      subtitle: _subtitle != null ? Text(_subtitle!) : null,
    );
  }

  Widget _slideError(ThemeData theme, String message) {
    if (widget.compact) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            message,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.error,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return ListTile(
      leading: Icon(Icons.error_outline, color: theme.colorScheme.error),
      title: Text(widget.image.fileName),
      subtitle: Text(message),
    );
  }

  Widget _buildPdfPreview(ThemeData theme, Uint8List bytes) {
    if (widget.compact) {
      return Material(
        color: theme.colorScheme.surfaceContainerHighest,
        child: InkWell(
          onTap: () => _onTap(context, bytes),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_compactCaption(theme) != null) _compactCaption(theme)!,
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.picture_as_pdf,
                        size: 48,
                        color: theme.colorScheme.error,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tap to view PDF',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.showHeader) _listHeader(theme, Icons.picture_as_pdf),
        Material(
          color: theme.colorScheme.surfaceContainerHighest,
          child: InkWell(
            onTap: () => _onTap(context, bytes),
            child: SizedBox(
              height: 320,
              child: PdfPreview(
                build: (_) async => bytes,
                canChangePageFormat: false,
                canChangeOrientation: false,
                pdfFileName: widget.image.fileName,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRasterPreview(ThemeData theme, Uint8List bytes) {
    final preview = Material(
      color: theme.colorScheme.surfaceContainerHighest,
      child: InkWell(
        onTap: () => _onTap(context, bytes),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: widget.maxPreviewHeight),
          child: Center(
            child: Image.memory(
              bytes,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Preview not available for this file.',
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.compact) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_compactCaption(theme) != null) _compactCaption(theme)!,
          Expanded(child: preview),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.showHeader) _listHeader(theme, Icons.image_outlined),
        preview,
      ],
    );
  }

  Widget _buildUnknownPreview(ThemeData theme, Uint8List bytes) {
    final tile = ListTile(
      leading: Icon(
        Icons.insert_drive_file_outlined,
        color: theme.colorScheme.primary,
      ),
      title: Text(widget.image.fileName),
      subtitle: _subtitle != null ? Text(_subtitle!) : null,
      trailing: IconButton(
        tooltip: 'Save file',
        onPressed: () => savePatientRadiologyImageBytes(
          context,
          image: widget.image,
          bytes: bytes,
        ),
        icon: const Icon(Icons.save_alt_outlined),
      ),
      onTap: () => _onTap(context, bytes),
    );

    if (widget.compact) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_compactCaption(theme) != null) _compactCaption(theme)!,
          Expanded(
            child: Center(
              child: Text(
                'Tap to view options',
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          tile,
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        tile,
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Text(
            'Preview not available for this file type.',
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  Widget? _compactCaption(ThemeData theme) {
    if (_subtitle == null && widget.image.fileName.isEmpty) return null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.image.fileName,
            style: theme.textTheme.labelLarge,
            overflow: TextOverflow.ellipsis,
          ),
          if (_subtitle != null)
            Text(
              _subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
        ],
      ),
    );
  }

  Widget _listHeader(ThemeData theme, IconData icon) {
    return ListTile(
      dense: true,
      leading: Icon(
        icon,
        color: icon == Icons.picture_as_pdf ? theme.colorScheme.error : null,
      ),
      title: Text(widget.image.fileName),
      subtitle: _subtitle != null ? Text(_subtitle!) : null,
    );
  }
}

class PatientRadiologyImageCarousel extends StatefulWidget {
  const PatientRadiologyImageCarousel({
    super.key,
    required this.service,
    required this.reportId,
    required this.images,
    this.height = 280,
  });

  final RadiologyService service;
  final String reportId;
  final List<RadiologyReportImage> images;
  final double height;

  @override
  State<PatientRadiologyImageCarousel> createState() =>
      _PatientRadiologyImageCarouselState();
}

class _PatientRadiologyImageCarouselState
    extends State<PatientRadiologyImageCarousel> {
  late final PageController _pageController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PatientRadiologyImageCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.images.length != widget.images.length) {
      final maxIndex = widget.images.isEmpty ? 0 : widget.images.length - 1;
      if (_index > maxIndex) {
        setState(() => _index = maxIndex);
        if (_pageController.hasClients) {
          _pageController.jumpToPage(_index);
        }
      }
    }
  }

  void _goToPage(int index) {
    if (index < 0 || index >= widget.images.length) return;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (widget.images.isEmpty) {
      return Text(
        'No files uploaded for this report yet.',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            IconButton(
              tooltip: 'Previous',
              visualDensity: VisualDensity.compact,
              onPressed: _index > 0 ? () => _goToPage(_index - 1) : null,
              icon: const Icon(Icons.chevron_left),
            ),
            Expanded(
              child: Text(
                '${_index + 1} / ${widget.images.length}',
                style: theme.textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              tooltip: 'Next',
              visualDensity: VisualDensity.compact,
              onPressed: _index < widget.images.length - 1
                  ? () => _goToPage(_index + 1)
                  : null,
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            'Swipe or use arrows · tap to expand',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: widget.height,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: PageView.builder(
                controller: _pageController,
                physics: const PageScrollPhysics(),
                itemCount: widget.images.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) {
                  final image = widget.images[i];
                  return PatientRadiologyImageSlide(
                    service: widget.service,
                    reportId: widget.reportId,
                    image: image,
                    showHeader: false,
                    compact: true,
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (i) {
            final active = i == _index;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: active ? 10 : 6,
                height: active ? 10 : 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: active
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outline.withValues(alpha: 0.4),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
