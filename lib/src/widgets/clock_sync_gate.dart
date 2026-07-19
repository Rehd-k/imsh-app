import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../config/api_config.dart';
import '../core/theme/app_theme.dart';
import '../core/utils/user_error_message.dart';
import '../features/splash/widgets/splash_branding.dart';
import '../helper/app_timezone.dart';
import '../helper/date_formatter.dart';
import '../models/server_time_model.dart';
import '../services/api_endpoint_selector.dart';
import '../services/api_service.dart';
import '../services/server_time_service.dart';
import '../shared/widgets/imsh_error_panel.dart';

class ClockSyncGate extends StatefulWidget {
  const ClockSyncGate({super.key, required this.child});

  final Widget child;

  @override
  State<ClockSyncGate> createState() => _ClockSyncGateState();
}

class _ClockSyncGateState extends State<ClockSyncGate> {
  _GatePhase _phase = _GatePhase.loading;
  String? _message;
  Object? _error;
  ServerTimePayload? _serverTime;

  @override
  void initState() {
    super.initState();
    _runCheck();
  }

  Future<void> _runCheck() async {
    setState(() {
      _phase = _GatePhase.loading;
      _message = null;
      _error = null;
      _serverTime = null;
    });

    final timeService = ServerTimeService();
    try {
      final probe = await ApiEndpointSelector.selectFastest(
        kApiCandidateBaseUrls,
      );
      ApiService().setBaseUrl(probe.baseUrl);
      debugLogApi(
        'ClockSyncGate: using ${probe.baseUrl} '
        '(${probe.latency.inMilliseconds}ms)',
      );

      final server = probe.serverTime;
      final skew = timeService.skewMsIfInvalid(server);
      if (!mounted) return;
      if (skew != null) {
        setState(() {
          _phase = _GatePhase.clockMismatch;
          _serverTime = server;
          _message =
              'Your device date and time do not match the hospital server '
              '(difference about ${_formatDuration(skew)}). '
              'Correct your device clock in Settings, then try again.';
        });
        return;
      }
      setState(() => _phase = _GatePhase.ok);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _phase = _GatePhase.error;
        _error = e;
        _message = userFacingErrorMessage(e);
      });
    }
  }

  static String _formatDuration(int ms) {
    if (ms < 60000) return '${(ms / 1000).round()} seconds';
    final minutes = ms / 60000;
    if (minutes < 60) return '${minutes.round()} minutes';
    return '${(minutes / 60).toStringAsFixed(1)} hours';
  }

  @override
  Widget build(BuildContext context) {
    switch (_phase) {
      case _GatePhase.ok:
        return widget.child;
      case _GatePhase.loading:
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: kIsWeb
              ? const Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 24),
                        Text('Connecting to hospital server…'),
                      ],
                    ),
                  ),
                )
              : const Scaffold(
                  body: SplashBranding(),
                ),
        );
      case _GatePhase.clockMismatch:
        final server = _serverTime;
        final brightness = MediaQuery.platformBrightnessOf(context);
        final theme = brightness == Brightness.dark
            ? AppTheme.darkTheme
            : AppTheme.lightTheme;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: Scaffold(
            body: SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 56,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Device time is incorrect',
                          style: theme.textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _message ?? '',
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        if (server != null) ...[
                          const SizedBox(height: 24),
                          Text(
                            'Server time: ${DateFormatter.dateTimeWithSeconds(DateTime.fromMillisecondsSinceEpoch(server.unixMs))}',
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'This device: ${DateFormatter.dateTimeWithSeconds(AppTimezone.now())}',
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                        const SizedBox(height: 32),
                        FilledButton(
                          onPressed: _runCheck,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      case _GatePhase.error:
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: Scaffold(
            body: SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: ImshErrorPanel(
                    title: 'Connection failed',
                    message: _message ?? userFacingErrorMessage(_error ?? ''),
                    icon: Icons.cloud_off,
                    tips: isNetworkRelatedError(_error ?? '')
                        ? networkErrorTips
                        : const [],
                    onRetry: _runCheck,
                    retryLabel: 'Retry',
                  ),
                ),
              ),
            ),
          ),
        );
    }
  }
}

enum _GatePhase { loading, ok, clockMismatch, error }
