import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:imsh/app_router.gr.dart';

import '../../firebase_options.dart';
import '../core/storage/token_storage.dart';
import '../core/utils/device_platform.dart';
import 'device_service.dart';
import 'navigation_service.dart';

/// Android notification channel used for FCM + local foreground display.
const kFcmAndroidChannelId = 'imsh_high_importance';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

typedef DeviceApprovedCallback = Future<void> Function();
typedef FamilyAppointmentCallback = void Function({
  required String appointmentId,
  required String forPatientId,
  String? subjectName,
});

class FcmPushService {
  FcmPushService({DeviceService? deviceService})
    : _deviceService = deviceService ?? DeviceService();

  final DeviceService _deviceService;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  bool _registering = false;

  /// Invoked when a DEVICE_APPROVED push arrives (pending screen / auth).
  DeviceApprovedCallback? onDeviceApproved;

  /// Invoked when an appointment push targets a family child.
  FamilyAppointmentCallback? onFamilyAppointment;

  static const _androidInit = AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );
  static const _darwinInit = DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  Future<void> initialize() async {
    if (_initialized || kIsWeb) return;
    _initialized = true;

    await _localNotifications.initialize(
      settings: const InitializationSettings(
        android: _androidInit,
        iOS: _darwinInit,
      ),
      onDidReceiveNotificationResponse: _onLocalNotificationTapped,
    );

    final androidPlugin = _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        kFcmAndroidChannelId,
        'IMSH Alerts',
        description: 'Appointment reminders and hospital announcements',
        importance: Importance.high,
      ),
    );

    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen(_showForegroundNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpened);
    _messaging.onTokenRefresh.listen(_onTokenRefresh);

    final initial = await _messaging.getInitialMessage();
    if (initial != null) {
      Future<void>.delayed(const Duration(milliseconds: 800), () {
        _handleMessageOpened(initial);
      });
    }
  }

  Future<void> registerAfterAuth() async {
    if (kIsWeb || _registering) return;
    _registering = true;
    try {
      await initialize();
      await _requestPermission();

      final token = await _messaging.getToken();
      if (token == null || token.isEmpty) return;

      await _deviceService.updateFcmToken(
        token: token,
        platform: patientApiPlatform(),
      );
      await TokenStorage.saveFcmToken(token);
    } catch (e, st) {
      debugPrint('FCM registerAfterAuth failed: $e\n$st');
    } finally {
      _registering = false;
    }
  }

  /// Logout deletes the device via auth logout; just clear local FCM cache.
  Future<void> unregisterOnLogout() async {
    if (kIsWeb) return;
    await TokenStorage.deleteFcmToken();
  }

  Future<void> _requestPermission() async {
    await _messaging.requestPermission(alert: true, badge: true, sound: true);

    final androidPlugin = _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidPlugin?.requestNotificationsPermission();
  }

  Future<void> _onTokenRefresh(String newToken) async {
    if (!await TokenStorage.hasToken()) {
      await TokenStorage.saveFcmToken(newToken);
      return;
    }
    try {
      await _deviceService.updateFcmToken(
        token: newToken,
        platform: patientApiPlatform(),
      );
      await TokenStorage.saveFcmToken(newToken);
    } catch (e, st) {
      debugPrint('FCM onTokenRefresh failed: $e\n$st');
    }
  }

  Future<void> _showForegroundNotification(RemoteMessage message) async {
    final notification = message.notification;
    final title = notification?.title ?? 'IMSH';
    final body = notification?.body ?? '';
    if (body.isEmpty && notification == null) return;

    final payload = jsonEncode(message.data);

    await _localNotifications.show(
      id: message.messageId?.hashCode.abs() ?? message.hashCode.abs(),
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          kFcmAndroidChannelId,
          'IMSH Alerts',
          channelDescription:
              'Appointment reminders and hospital announcements',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: payload,
    );
  }

  void _onLocalNotificationTapped(NotificationResponse response) {
    final payload = response.payload;
    if (payload == null || payload.isEmpty) return;
    try {
      final data = Map<String, dynamic>.from(
        jsonDecode(payload) as Map<dynamic, dynamic>,
      );
      _navigateFromData(data);
    } catch (e, st) {
      debugPrint('FCM local tap parse failed: $e\n$st');
    }
  }

  void _handleMessageOpened(RemoteMessage message) {
    _navigateFromData(message.data);
  }

  void _navigateFromData(Map<String, dynamic> data) {
    final type = data['type']?.toString();

    try {
      if (type == 'DEVICE_APPROVED') {
        final callback = onDeviceApproved;
        if (callback != null) {
          callback();
        } else {
          NavigationService.router.replaceAll([const PatientShellRoute()]);
        }
        return;
      }

      if (type == 'APPOINTMENT') {
        final appointmentId = data['appointmentId']?.toString();
        if (appointmentId == null || appointmentId.isEmpty) {
          NavigationService.router.push(const NotificationsRoute());
          return;
        }

        final forPatientId = data['forPatientId']?.toString();
        final isFamily = data['isFamily']?.toString() == 'true' ||
            (forPatientId != null && forPatientId.isNotEmpty);

        if (isFamily && forPatientId != null && forPatientId.isNotEmpty) {
          onFamilyAppointment?.call(
            appointmentId: appointmentId,
            forPatientId: forPatientId,
            subjectName: data['subjectName']?.toString(),
          );
          NavigationService.router.push(
            AppointmentDetailRoute(id: appointmentId),
          );
          return;
        }

        NavigationService.router.push(
          AppointmentDetailRoute(id: appointmentId),
        );
        return;
      }

      NavigationService.router.push(const NotificationsRoute());
    } catch (e, st) {
      debugPrint('FCM navigation failed: $e\n$st');
    }
  }
}
