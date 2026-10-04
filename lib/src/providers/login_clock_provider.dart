import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginDraftState {
  const LoginDraftState({this.dob, this.patientIdError, this.dobError});

  final DateTime? dob;
  final String? patientIdError;
  final String? dobError;
}

class LoginDraftNotifier extends Notifier<LoginDraftState> {
  @override
  LoginDraftState build() => const LoginDraftState();

  void setDob(DateTime dob) {
    state = LoginDraftState(dob: dob, patientIdError: state.patientIdError);
  }

  void clearPatientIdError() {
    if (state.patientIdError == null) return;
    state = LoginDraftState(dob: state.dob, dobError: state.dobError);
  }

  bool validate({required String patientId}) {
    final idEmpty = patientId.trim().isEmpty;
    final dobMissing = state.dob == null;
    state = LoginDraftState(
      dob: state.dob,
      patientIdError: idEmpty ? 'Patient ID is required' : null,
      dobError: dobMissing ? 'Date of birth is required' : null,
    );
    return !idEmpty && !dobMissing;
  }
}

final loginDraftProvider =
    NotifierProvider.autoDispose<LoginDraftNotifier, LoginDraftState>(
      LoginDraftNotifier.new,
    );
