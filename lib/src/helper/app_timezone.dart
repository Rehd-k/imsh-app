import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

class AppTimezone {
  AppTimezone._();

  static const locationName = 'Africa/Lagos';

  static late final tz.Location _location;
  static bool _initialized = false;

  static Future<void> initialize() async {
    if (_initialized) return;
    tz_data.initializeTimeZones();
    _location = tz.getLocation(locationName);
    _initialized = true;
  }

  static void _ensureInitialized() {
    if (!_initialized) {
      throw StateError(
        'AppTimezone not initialized. Call AppTimezone.initialize() in main().',
      );
    }
  }

  static tz.TZDateTime now() {
    _ensureInitialized();
    return tz.TZDateTime.now(_location);
  }

  static tz.TZDateTime toLocal(DateTime dt) {
    _ensureInitialized();
    final utc = dt.isUtc ? dt : dt.toUtc();
    return tz.TZDateTime.from(utc, _location);
  }

  static DateTime toUtc(DateTime lagosWall) {
    _ensureInitialized();
    if (lagosWall is tz.TZDateTime && lagosWall.location == _location) {
      return lagosWall.toUtc();
    }
    final tzDt = tz.TZDateTime(
      _location,
      lagosWall.year,
      lagosWall.month,
      lagosWall.day,
      lagosWall.hour,
      lagosWall.minute,
      lagosWall.second,
      lagosWall.millisecond,
      lagosWall.microsecond,
    );
    return tzDt.toUtc();
  }

  static String toBackendIso(DateTime lagosWall) =>
      toUtc(lagosWall).toIso8601String();

  static String dateOnlyKey(DateTime dt) {
    final local = toLocal(dt);
    return '${local.year.toString().padLeft(4, '0')}-'
        '${local.month.toString().padLeft(2, '0')}-'
        '${local.day.toString().padLeft(2, '0')}';
  }
}
