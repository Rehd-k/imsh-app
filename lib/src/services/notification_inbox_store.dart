import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class InboxNotification {
  const InboxNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.receivedAt,
    this.type,
    this.data = const {},
    this.pinned = false,
    this.read = false,
  });

  final String id;
  final String title;
  final String body;
  final String? type;
  final Map<String, String> data;
  final DateTime receivedAt;
  final bool pinned;
  final bool read;

  InboxNotification copyWith({bool? pinned, bool? read}) {
    return InboxNotification(
      id: id,
      title: title,
      body: body,
      type: type,
      data: data,
      receivedAt: receivedAt,
      pinned: pinned ?? this.pinned,
      read: read ?? this.read,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'type': type,
    'data': data,
    'receivedAt': receivedAt.toUtc().toIso8601String(),
    'pinned': pinned,
    'read': read,
  };

  factory InboxNotification.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];
    final data = <String, String>{};
    if (rawData is Map) {
      rawData.forEach((key, value) {
        data[key.toString()] = value?.toString() ?? '';
      });
    }
    return InboxNotification(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? 'IMSH',
      body: json['body']?.toString() ?? '',
      type: json['type']?.toString(),
      data: data,
      receivedAt:
          DateTime.tryParse(json['receivedAt']?.toString() ?? '') ??
          DateTime.now(),
      pinned: json['pinned'] == true,
      read: json['read'] == true,
    );
  }
}

/// Local inbox of pushes that arrived on this phone.
class NotificationInboxStore {
  NotificationInboxStore._();

  static final instance = NotificationInboxStore._();
  static const _key = 'patient_notification_inbox';
  static const _maxItems = 80;

  final _changes = StreamController<List<InboxNotification>>.broadcast();

  Stream<List<InboxNotification>> get changes => _changes.stream;

  Future<List<InboxNotification>> load() async {
    final items = await _read();
    _emit(items);
    return items;
  }

  Future<void> record({
    required String id,
    required String title,
    required String body,
    String? type,
    Map<String, String> data = const {},
    DateTime? receivedAt,
  }) async {
    final trimmedTitle = title.trim();
    final trimmedBody = body.trim();
    if (id.trim().isEmpty || (trimmedTitle.isEmpty && trimmedBody.isEmpty)) {
      return;
    }
    final items = await _read();
    if (items.any((item) => item.id == id)) {
      _emit(items);
      return;
    }
    items.insert(
      0,
      InboxNotification(
        id: id,
        title: trimmedTitle.isEmpty ? 'IMSH' : trimmedTitle,
        body: trimmedBody,
        type: type,
        data: data,
        receivedAt: receivedAt ?? DateTime.now(),
      ),
    );
    await _write(_trim(items));
  }

  Future<void> setPinned(String id, {required bool pinned}) async {
    final items = await _read();
    final next = [
      for (final item in items)
        if (item.id == id) item.copyWith(pinned: pinned) else item,
    ];
    await _write(next);
  }

  Future<void> markRead(String id) async {
    final items = await _read();
    final next = [
      for (final item in items)
        if (item.id == id) item.copyWith(read: true) else item,
    ];
    await _write(next);
  }

  Future<void> delete(String id) async {
    final items = await _read();
    items.removeWhere((item) => item.id == id);
    await _write(items);
  }

  Future<List<InboxNotification>> _read() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return [];
      return decoded
          .whereType<Map>()
          .map(
            (row) => InboxNotification.fromJson(Map<String, dynamic>.from(row)),
          )
          .where((item) => item.id.isNotEmpty)
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> _write(List<InboxNotification> items) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(items.map((item) => item.toJson()).toList()),
    );
    _emit(items);
  }

  List<InboxNotification> _trim(List<InboxNotification> items) {
    if (items.length <= _maxItems) return items;
    final pinned = items.where((item) => item.pinned).toList();
    final rest = items.where((item) => !item.pinned).toList();
    final room = _maxItems - pinned.length;
    if (room <= 0) return pinned.take(_maxItems).toList();
    return [...pinned, ...rest.take(room)];
  }

  void _emit(List<InboxNotification> items) {
    if (!_changes.isClosed) _changes.add(List.unmodifiable(items));
  }
}
