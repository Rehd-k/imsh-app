import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:imsh/app_router.gr.dart';

import '../../firebase_options.dart';
import '../core/storage/token_storage.dart';
import '../core/utils/device_platform.dart';
import 'device_service.dart';
import 'navigation_service.dart';
import 'notification_inbox_store.dart';

/// Android notification channel used for FCM + local foreground display.
const kFcmAndroidChannelId = 'imsh_high_importance';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await rememberPush(message);
}

Future<void> rememberPush(RemoteMessage message) {
  final data = <String, String>{
    for (final entry in message.data.entries) entry.key: entry.value.toString(),
  };
  final hasContent =
      (message.notification?.title?.trim().isNotEmpty ?? false) ||
      (message.notification?.body?.trim().isNotEmpty ?? false) ||
      (data['title']?.trim().isNotEmpty ?? false) ||
      (data['body']?.trim().isNotEmpty ?? false) ||
      (data['type']?.trim().isNotEmpty ?? false);
  if (!hasContent) return Future.value();
  final title =
      message.notification?.title ?? data['title'] ?? _fallbackTitle(data['type']);
  final body = message.notification?.body ?? data['body'] ?? '';
  return NotificationInboxStore.instance.record(
    id: _inboxId(message, title: title, body: body),
    title: title,
    body: body,
    type: data['type'],
    data: data,
    receivedAt: message.sentTime,
  );
}

String _inboxId(RemoteMessage message, {required String title, required String body}) {
  final messageId = message.messageId?.trim();
  if (messageId != null && messageId.isNotEmpty) return messageId;
  final sent = message.sentTime?.millisecondsSinceEpoch;
  return [
    message.data['type'],
    title,
    body,
    message.data['appointmentId'],
    message.data['emergencyRequestId'],
    sent,
  ].where((part) => part != null && part.toString().trim().isNotEmpty).join('|');
}

String _fallbackTitle(String? type) {
  switch (type) {
    case 'APPOINTMENT':
      return 'Appointment';
    case 'MEDICATION':
    case 'MEDICATION_MISSED':
      return 'Medication';
    case 'EMERGENCY_REQUEST':
      return 'Emergency';
    case 'DEVICE_APPROVED':
      return 'Phone verified';
    default:
      return 'IMSH';
  }
}

typedef DeviceApprovedCallback = Future<void> Function();
typedef FamilyAppointmentCallback =
    void Function({
      required String appointmentId,
      required String forPatientId,
      String? subjectName,
    });

typedef FamilySubjectCallback =
    void Function({required String forPatientId, String? subjectName});

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

  /// Invoked when a medication push targets a family child (not self).
  FamilySubjectCallback? onFamilyMedication;

  /// Invoked when a push opens a screen the patient already came to use.
  VoidCallback? onOpenedFromNotification;

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
        description: 'Medication reminders, appointments, and hospital alerts',
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
      final type = initial.data['type']?.toString();
      if (type != 'DEVICE_APPROVED') {
        onOpenedFromNotification?.call();
      }
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
    await rememberPush(message);
    final notification = message.notification;
    final title = notification?.title ?? message.data['title']?.toString() ?? 'IMSH';
    final body = notification?.body ?? message.data['body']?.toString() ?? '';
    if (body.isEmpty && notification == null && title == 'IMSH') return;

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
              'Medication reminders, appointments, and hospital alerts',
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
    rememberPush(message);
    _navigateFromData(message.data);
  }

  void openFromData(Map<String, String> data) {
    _navigateFromData(data);
  }

  void _navigateFromData(Map<String, dynamic> data) {
    final type = data['type']?.toString();
    if (type != 'DEVICE_APPROVED') {
      onOpenedFromNotification?.call();
    }

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

      if (type == 'EMERGENCY_REQUEST') {
        final requestId = data['emergencyRequestId']?.toString();
        if (requestId != null && requestId.isNotEmpty) {
          NavigationService.router.push(
            EmergencyRequestDetailRoute(id: requestId),
          );
          return;
        }
        NavigationService.router.push(const EmergencyRequestsRoute());
        return;
      }

      if (type == 'MEDICATION' || type == 'MEDICATION_MISSED') {
        final forPatientId = data['patientId']?.toString();
        if (forPatientId != null && forPatientId.isNotEmpty) {
          onFamilyMedication?.call(
            forPatientId: forPatientId,
            subjectName: data['subjectName']?.toString(),
          );
        }
        NavigationService.router.push(const MedicationsRoute());
        return;
      }

      if (type == 'APPOINTMENT') {
        final appointmentId = data['appointmentId']?.toString();
        if (appointmentId == null || appointmentId.isEmpty) {
          NavigationService.router.push(const NotificationsRoute());
          return;
        }

        final forPatientId = data['forPatientId']?.toString();
        final isFamily =
            data['isFamily']?.toString() == 'true' ||
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
