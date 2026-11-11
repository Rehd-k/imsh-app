/// Server-backed binding for the current install's device key.
/// Set after [PatientAuthService.lookupDevice]; cleared when the number is released.
class DeviceBinding {
  DeviceBinding._();

  static var verified = false;
  static String? lockedPhoneNumber;

  static void apply({required bool verified, String? phoneNumber}) {
    final phone = phoneNumber?.trim();
    DeviceBinding.verified = verified && phone != null && phone.isNotEmpty;
    lockedPhoneNumber = DeviceBinding.verified ? phone : null;
  }

  static void lockPhone(String phone) {
    final value = phone.trim();
    if (value.isEmpty) return;
    verified = true;
    lockedPhoneNumber = value;
  }

  static void clear() {
    verified = false;
    lockedPhoneNumber = null;
  }
}
