import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginDraftState {
  const LoginDraftState({this.phoneError, this.passwordError});

  final String? phoneError;
  final String? passwordError;
}

class LoginDraftNotifier extends Notifier<LoginDraftState> {
  @override
  LoginDraftState build() => const LoginDraftState();

  void clearPhoneError() {
    if (state.phoneError == null) return;
    state = LoginDraftState(passwordError: state.passwordError);
  }

  void clearPasswordError() {
    if (state.passwordError == null) return;
    state = LoginDraftState(phoneError: state.phoneError);
  }

  bool validate({required String phone, required String password}) {
    final phoneEmpty = phone.trim().isEmpty;
    final passwordEmpty = password.isEmpty;
    final passwordShort = !passwordEmpty && password.length < 8;
    state = LoginDraftState(
      phoneError: phoneEmpty ? 'Phone number is required' : null,
      passwordError: passwordEmpty
          ? 'Password is required'
          : passwordShort
          ? 'Password must be at least 8 characters'
          : null,
    );
    return !phoneEmpty && !passwordEmpty && !passwordShort;
  }
}

final loginDraftProvider =
    NotifierProvider.autoDispose<LoginDraftNotifier, LoginDraftState>(
      LoginDraftNotifier.new,
    );
