import 'package:shared_preferences/shared_preferences.dart';

/// Phone number kept on the device when Remember me is checked.
class RememberedPhone {
  RememberedPhone._();

  static const _key = 'remembered_phone';

  static Future<String?> read() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_key)?.trim();
    if (value == null || value.isEmpty) return null;
    return value;
  }

  static Future<void> save(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, phone.trim());
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
