import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';

import 'store_update_screen.dart';

class StoreUpdatePrompt extends StatelessWidget {
  const StoreUpdatePrompt({
    super.key,
    required this.currentVersion,
    required this.minAppVersion,
  });

  final String currentVersion;
  final String minAppVersion;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return IosStoreUpdatePrompt(
        currentVersion: currentVersion,
        minAppVersion: minAppVersion,
      );
    }
    return AndroidStoreUpdatePrompt(
      currentVersion: currentVersion,
      minAppVersion: minAppVersion,
    );
  }
}

class AndroidStoreUpdatePrompt extends StatefulWidget {
  const AndroidStoreUpdatePrompt({
    super.key,
    required this.currentVersion,
    required this.minAppVersion,
  });

  final String currentVersion;
  final String minAppVersion;

  @override
  State<AndroidStoreUpdatePrompt> createState() =>
      _AndroidStoreUpdatePromptState();
}

class _AndroidStoreUpdatePromptState extends State<AndroidStoreUpdatePrompt>
    with WidgetsBindingObserver {
  bool _busy = false;
  String? _status;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startImmediateUpdate();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _startImmediateUpdate();
    }
  }

  /// Starts Play's full-screen update when one is available.
  /// Returns true when Play took over the update.
  Future<bool> _startImmediateUpdate() async {
    if (!Platform.isAndroid || _busy) return false;
    setState(() {
      _busy = true;
      _status = 'Checking the Play Store…';
    });
    var started = false;
    try {
      final info = await InAppUpdate.checkForUpdate();
      final inProgress =
          info.updateAvailability ==
          UpdateAvailability.developerTriggeredUpdateInProgress;
      final available =
          info.updateAvailability == UpdateAvailability.updateAvailable;
      if ((available || inProgress) && info.immediateUpdateAllowed) {
        started = true;
        if (mounted) {
          setState(() => _status = 'Play Store is installing the update…');
        }
        final result = await InAppUpdate.performImmediateUpdate();
        if (!mounted) return true;
        if (result == AppUpdateResult.userDeniedUpdate) {
          setState(() {
            _status =
                'The update has to be installed before IMSH Patient can open.';
          });
        } else if (result == AppUpdateResult.inAppUpdateFailed) {
          setState(() {
            _status = 'Play Store could not install the update. Try again.';
          });
        }
      } else if (mounted) {
        setState(() => _status = null);
      }
    } catch (_) {
      if (mounted) setState(() => _status = null);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
    return started;
  }

  Future<void> _update() async {
    final started = await _startImmediateUpdate();
    if (!mounted || started) return;
    await _openPlayListing();
  }

  Future<void> _openPlayListing() async {
    final info = await PackageInfo.fromPlatform();
    final id = info.packageName;
    final market = Uri.parse('market://details?id=$id');
    final web = Uri.parse('https://play.google.com/store/apps/details?id=$id');
    if (await canLaunchUrl(market)) {
      await launchUrl(market, mode: LaunchMode.externalApplication);
      return;
    }
    await launchUrl(web, mode: LaunchMode.externalApplication);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreUpdateScreen(
      currentVersion: widget.currentVersion,
      minAppVersion: widget.minAppVersion,
      storeName: 'Play Store',
      busy: _busy,
      status: _status,
      onUpdate: _update,
    );
  }
}

class IosStoreUpdatePrompt extends StatefulWidget {
  const IosStoreUpdatePrompt({
    super.key,
    required this.currentVersion,
    required this.minAppVersion,
  });

  final String currentVersion;
  final String minAppVersion;

  @override
  State<IosStoreUpdatePrompt> createState() => _IosStoreUpdatePromptState();
}

class _IosStoreUpdatePromptState extends State<IosStoreUpdatePrompt> {
  late final Upgrader _upgrader = Upgrader(
    minAppVersion: widget.minAppVersion,
    showOnlyMandatoryUpdates: true,
    durationUntilAlertAgain: Duration.zero,
  );
  String? _status;

  Future<void> _openAppStore() async {
    await _upgrader.initialize();
    final listing = _upgrader.currentAppStoreListingURL;
    if (listing == null || listing.isEmpty) {
      if (!mounted) return;
      setState(() {
        _status = 'Open the App Store and search for IMSH Patient.';
      });
      return;
    }
    final opened = await launchUrl(
      Uri.parse(listing),
      mode: LaunchMode.externalApplication,
    );
    if (!opened && mounted) {
      setState(() {
        _status = 'Open the App Store and search for IMSH Patient.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: _upgrader,
      dialogStyle: UpgradeDialogStyle.cupertino,
      barrierDismissible: false,
      showIgnore: false,
      showLater: false,
      showReleaseNotes: false,
      shouldPopScope: () => false,
      onUpdate: () {
        unawaited(_openAppStore());
        return false;
      },
      child: StoreUpdateScreen(
        currentVersion: widget.currentVersion,
        minAppVersion: widget.minAppVersion,
        storeName: 'App Store',
        status: _status,
        onUpdate: _openAppStore,
      ),
    );
  }
}
