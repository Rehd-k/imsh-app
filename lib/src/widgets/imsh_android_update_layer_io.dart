import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../services/api_service.dart';
import '../services/imsh_android_update_service.dart';

enum _UpdateUiStatus {
  idle,
  checking,
  downloading,
  readyToInstall,
  error,
  upToDate,
}

/// Android-only overlay: background version check, auto-download, install chip.
class ImshAndroidUpdateLayer extends StatefulWidget {
  const ImshAndroidUpdateLayer({super.key, required this.child});

  final Widget child;

  @override
  State<ImshAndroidUpdateLayer> createState() => _ImshAndroidUpdateLayerState();
}

class _ImshAndroidUpdateLayerState extends State<ImshAndroidUpdateLayer>
    with WidgetsBindingObserver {
  String? _currentVersion;
  String? _latestVersion;
  String? _apkPath;
  double _progress = 0;
  _UpdateUiStatus _status = _UpdateUiStatus.idle;
  CancelToken? _downloadCancel;
  bool _checkInFlight = false;
  bool _dismissed = false;
  DateTime? _lastCheckAt;

  @override
  void initState() {
    super.initState();
    if (!Platform.isAndroid) return;
    WidgetsBinding.instance.addObserver(this);
    ImshAndroidUpdateService.checkForUpdate = () {
      unawaited(_checkForUpdate(fromUi: true));
    };
    PackageInfo.fromPlatform().then((p) {
      if (!mounted) return;
      setState(() => _currentVersion = p.version.trim());
      unawaited(_waitForApiThenCheck());
    });
  }

  Future<void> _waitForApiThenCheck() async {
    for (var i = 0; i < 40; i++) {
      final base = ApiService().apiBaseUrl.trim();
      if (base.isNotEmpty && ApiService().resolvedBaseUrl != null) {
        break;
      }
      await Future<void>.delayed(const Duration(milliseconds: 250));
      if (!mounted) return;
    }
    await _checkForUpdate();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final last = _lastCheckAt;
      if (last == null ||
          DateTime.now().difference(last) > const Duration(minutes: 15)) {
        unawaited(_checkForUpdate());
      }
    }
  }

  Future<void> _checkForUpdate({bool fromUi = false}) async {
    if (!Platform.isAndroid || _currentVersion == null) return;
    if (_checkInFlight) return;
    if (_status == _UpdateUiStatus.downloading ||
        _status == _UpdateUiStatus.readyToInstall) {
      if (fromUi && _status == _UpdateUiStatus.readyToInstall) {
        await _installApk();
      }
      return;
    }

    _checkInFlight = true;
    _dismissed = false;
    if (mounted) {
      setState(() => _status = _UpdateUiStatus.checking);
    }

    try {
      _lastCheckAt = DateTime.now();
      final latest = await ImshAndroidUpdateService.fetchLatestVersion();
      if (!mounted) return;

      if (latest == null ||
          !ImshAndroidUpdateService.isNewerThan(latest, _currentVersion!)) {
        setState(() {
          _status = fromUi ? _UpdateUiStatus.upToDate : _UpdateUiStatus.idle;
          _latestVersion = latest;
        });
        if (fromUi) {
          _showSnack('You are on the latest version.');
        }
        return;
      }

      setState(() {
        _latestVersion = latest;
        _status = _UpdateUiStatus.downloading;
        _progress = 0;
      });
      await _startDownload(latest);
    } catch (e) {
      if (!mounted) return;
      setState(() => _status = _UpdateUiStatus.error);
      _showSnack(
        ImshAndroidUpdateService.lastVersionCheckMessage ??
            'Could not check for updates. Verify your network and try again.',
      );
    } finally {
      _checkInFlight = false;
    }
  }

  Future<void> _startDownload(String version) async {
    _downloadCancel?.cancel();
    _downloadCancel = CancelToken();
    try {
      final path = await ImshAndroidUpdateService.downloadLatestApk(
        version: version,
        cancelToken: _downloadCancel,
        onProgress: (p) {
          if (mounted) setState(() => _progress = p);
        },
      );
      if (!mounted) return;
      setState(() {
        _apkPath = path;
        _status = _UpdateUiStatus.readyToInstall;
        _progress = 1;
      });
    } catch (e) {
      if (_downloadCancel?.isCancelled == true) return;
      if (!mounted) return;
      setState(() => _status = _UpdateUiStatus.error);
      _showSnack(
        'The update could not be downloaded. Check your network and free space, then try again.',
      );
    }
  }

  Future<void> _installApk() async {
    final path = _apkPath;
    if (path == null || !await File(path).exists()) {
      if (_latestVersion != null) {
        setState(() => _status = _UpdateUiStatus.downloading);
        await _startDownload(_latestVersion!);
      }
      return;
    }

    final installStatus = await Permission.requestInstallPackages.status;
    if (!installStatus.isGranted) {
      final requested = await Permission.requestInstallPackages.request();
      if (!requested.isGranted) {
        _showSnack(
          'Allow IMSH to install updates in system settings, then tap Install again.',
        );
        await openAppSettings();
        return;
      }
    }

    final result = await OpenFilex.open(
      path,
      type: 'application/vnd.android.package-archive',
    );
    if (result.type != ResultType.done && mounted) {
      _showSnack(
        result.message.isNotEmpty
            ? result.message
            : 'Could not open the installer. Try again.',
      );
    }
  }

  void _showSnack(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final messenger = ScaffoldMessenger.maybeOf(context);
      messenger?.showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 6),
          behavior: SnackBarBehavior.floating,
        ),
      );
    });
  }

  void _dismiss() {
    _downloadCancel?.cancel();
    setState(() {
      _dismissed = true;
      _status = _UpdateUiStatus.idle;
    });
  }

  Widget? _buildChip(BuildContext context) {
    if (_dismissed) return null;
    final scheme = Theme.of(context).colorScheme;

    switch (_status) {
      case _UpdateUiStatus.downloading:
        final pct = (_progress * 100).clamp(0, 100).round();
        return _ChipShell(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  value: _progress > 0.02 ? _progress : null,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Downloading update… $pct%',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(width: 4),
              IconButton(
                visualDensity: VisualDensity.compact,
                tooltip: 'Dismiss',
                onPressed: _dismiss,
                icon: const Icon(Icons.close, size: 18),
              ),
            ],
          ),
        );
      case _UpdateUiStatus.readyToInstall:
        return _ChipShell(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton.icon(
                onPressed: _installApk,
                icon: const Icon(Icons.system_update_alt, size: 18),
                label: Text(
                  _latestVersion != null
                      ? 'Update ready — Install ${_latestVersion!}'
                      : 'Update ready — Install',
                ),
                style: FilledButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  backgroundColor: scheme.primary,
                ),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                tooltip: 'Dismiss',
                onPressed: _dismiss,
                icon: Icon(Icons.close, size: 18, color: scheme.onSurface),
              ),
            ],
          ),
        );
      case _UpdateUiStatus.checking:
      case _UpdateUiStatus.idle:
      case _UpdateUiStatus.error:
      case _UpdateUiStatus.upToDate:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!Platform.isAndroid || kIsWeb) {
      return widget.child;
    }

    final chip = _buildChip(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(child: widget.child),
        if (chip != null)
          Positioned(
            right: 16,
            bottom: 16,
            child: SafeArea(child: chip),
          ),
      ],
    );
  }

  @override
  void dispose() {
    if (Platform.isAndroid) {
      WidgetsBinding.instance.removeObserver(this);
      ImshAndroidUpdateService.checkForUpdate = null;
      _downloadCancel?.cancel();
    }
    super.dispose();
  }
}

class _ChipShell extends StatelessWidget {
  const _ChipShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(14),
      color: scheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: child,
      ),
    );
  }
}
