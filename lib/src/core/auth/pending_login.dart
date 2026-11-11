/// In-memory handoff from the login screen into phone verification.
/// Holds the password only until the code step finishes or the screen closes.
class PendingLogin {
  PendingLogin._();

  static String? phone;
  static String? password;

  /// The account has no password yet, so verification must create one.
  static var activateOnly = false;

  static void remember({
    required String phone,
    String? password,
    bool activateOnly = false,
  }) {
    final value = phone.trim();
    PendingLogin.phone = value.isEmpty ? null : value;
    PendingLogin.password =
        password == null || password.isEmpty ? null : password;
    PendingLogin.activateOnly = activateOnly;
  }

  static void clear() {
    phone = null;
    password = null;
    activateOnly = false;
  }
}
