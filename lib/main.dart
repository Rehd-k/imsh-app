import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'app_router.gr.dart';
import 'src/core/interceptors/error_interceptor.dart';
import 'src/core/theme/app_theme.dart';
import 'src/helper/app_timezone.dart';
import 'src/models/device_model.dart';
import 'src/providers/auth_provider.dart';
import 'src/providers/family_provider.dart';
import 'src/providers/theme_mode_provider.dart';
import 'src/services/fcm_push_service.dart';
import 'src/services/navigation_service.dart';
import 'src/shared/widgets/offline_banner.dart';
import 'src/widgets/app_notification_host.dart';
import 'src/widgets/clock_sync_gate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (!kIsWeb) {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }
  await AppTimezone.initialize();
  final prefs = await SharedPreferences.getInstance();
  final initialThemeMode = ThemeModePersistence.read(prefs);

  runApp(
    ProviderScope(
      overrides: [
        themeModeProvider.overrideWith(
          (ref) => ThemeModeNotifier(initialThemeMode),
        ),
      ],
      child: const ClockSyncGate(child: ImshApp()),
    ),
  );
}

class ImshApp extends ConsumerStatefulWidget {
  const ImshApp({super.key});

  @override
  ConsumerState<ImshApp> createState() => _ImshAppState();
}

class _ImshAppState extends ConsumerState<ImshApp> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(patientAuthProvider.notifier).restoreSession();
      _wireAuthSessionHooks();
      _wireFcmCallbacks();
    });
  }

  void _wireAuthSessionHooks() {
    AuthSessionHooks.onDeviceRevoked = () {
      ref.read(familyViewProvider.notifier).clear();
      ref.read(patientAuthProvider.notifier).handleDeviceRevoked();
    };
    AuthSessionHooks.onDevicePendingApproval = () {
      final device = ref.read(patientAuthProvider).device;
      if (device != null) {
        ref
            .read(patientAuthProvider.notifier)
            .updateDevice(device.copyWith(status: PatientDeviceStatus.pending));
      }
    };
  }

  void _wireFcmCallbacks() {
    final fcm = ref.read(fcmPushServiceProvider);
    fcm.onDeviceApproved = () async {
      try {
        await ref.read(patientAuthProvider.notifier).refreshDeviceStatus();
      } catch (_) {
        ref.read(patientAuthProvider.notifier).markDeviceApproved();
      }
      NavigationService.router.replaceAll([const PatientShellRoute()]);
    };
    fcm.onFamilyAppointment =
        ({
          required String appointmentId,
          required String forPatientId,
          String? subjectName,
        }) {
          ref
              .read(familyViewProvider.notifier)
              .selectById(forPatientId, subjectName: subjectName);
        };
  }

  @override
  void dispose() {
    AuthSessionHooks.onDeviceRevoked = null;
    AuthSessionHooks.onDevicePendingApproval = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'IMSH Patient',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: NavigationService.router.config(),
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        final clampedScaler = TextScaler.linear(
          mediaQuery.textScaler.scale(1).clamp(0.9, 1.0),
        );

        return MediaQuery(
          data: mediaQuery.copyWith(textScaler: clampedScaler),
          child: AppNotificationHost(
            child: OfflineBanner(child: child ?? const SizedBox.shrink()),
          ),
        );
      },
    );
  }
}
