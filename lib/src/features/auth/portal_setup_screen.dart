import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/auth/biometric_auth.dart';
import '../../core/auth/pending_login.dart';
import '../../core/auth/remembered_phone.dart';
import '../../core/storage/token_storage.dart';
import '../../core/utils/user_error_message.dart';
import '../../helper/date_formatter.dart';
import '../../providers/auth_provider.dart';

@RoutePage()
class PortalSetupScreen extends ConsumerStatefulWidget {
  const PortalSetupScreen({super.key, this.reset = false});

  final bool reset;

  @override
  ConsumerState<PortalSetupScreen> createState() => _PortalSetupScreenState();
}

class _PortalSetupScreenState extends ConsumerState<PortalSetupScreen> {
  final _phone = TextEditingController();
  final _code = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  DateTime? _dob;
  int _step = 0;
  bool _busy = false;
  String? _error;
  String? _instructions;
  String? _setupToken;
  String? _deviceProof;
  String? _keptPassword;
  bool _hasPassword = false;
  bool _phoneLocked = false;
  bool _obscure = true;

  bool get _reset => widget.reset;

  @override
  void initState() {
    super.initState();
    final locked = DeviceBinding.lockedPhoneNumber?.trim();
    if (_reset && locked != null && locked.isNotEmpty) {
      PendingLogin.clear();
      _phone.text = locked;
      _phoneLocked = true;
      return;
    }
    final pendingPhone = PendingLogin.phone?.trim();
    if (pendingPhone != null && pendingPhone.isNotEmpty) {
      _phone.text = pendingPhone;
      _phoneLocked = true;
      if (!PendingLogin.activateOnly) {
        _keptPassword = PendingLogin.password;
        _hasPassword = _keptPassword != null;
      }
    }
  }

  @override
  void dispose() {
    _phone.dispose();
    _code.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _pickDob() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime(now.year - 30, now.month, now.day),
      firstDate: DateTime(now.year - 120),
      lastDate: now,
    );
    if (picked == null) return;
    setState(() {
      _dob = DateTime(picked.year, picked.month, picked.day);
      _error = null;
    });
  }

  Future<void> _requestCode() async {
    final phone = _phone.text.trim();
    if (phone.isEmpty || _dob == null) {
      setState(() => _error = 'Enter the phone number and date of birth on your file.');
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final auth = ref.read(patientAuthServiceProvider);
      final result = _reset
          ? await auth.requestPasswordReset(phoneNumber: phone, dob: _dob!)
          : await auth.requestActivation(phoneNumber: phone, dob: _dob!);
      if (!mounted) return;
      setState(() {
        _instructions = result.instructions;
        if (!_reset) {
          _hasPassword = result.hasPassword;
          if (!result.hasPassword) _keptPassword = null;
        }
        _step = 1;
        _busy = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _busy = false;
        _error = userFacingErrorMessage(e);
      });
    }
  }

  Future<void> _submitCode() async {
    final code = _code.text.trim();
    if (code.length < 6) {
      setState(() => _error = 'Enter the 6-digit code.');
      return;
    }
    if (_reset) {
      setState(() {
        _error = null;
        _step = 2;
      });
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final result = await ref.read(patientAuthServiceProvider).verifyActivation(
        phoneNumber: _phone.text.trim(),
        code: code,
        fcmToken: await TokenStorage.getFcmToken(),
      );
      if (!mounted) return;
      if (result.hasPassword) {
        _deviceProof = result.deviceProof;
        final kept = _keptPassword;
        if (kept != null && kept.isNotEmpty) {
          await _signInWithProof(kept);
          return;
        }
        setState(() {
          _hasPassword = true;
          _step = 2;
          _busy = false;
        });
        return;
      }
      setState(() {
        _setupToken = result.setupToken;
        _hasPassword = false;
        _keptPassword = null;
        _step = 2;
        _busy = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _busy = false;
        _error = userFacingErrorMessage(e);
      });
    }
  }

  Future<void> _savePassword() async {
    final password = _password.text;
    if (_hasPassword && !_reset) {
      if (password.length < 8) {
        setState(() => _error = 'Password must be at least 8 characters.');
        return;
      }
      await _signInWithProof(password);
      return;
    }
    if (password.length < 8) {
      setState(() => _error = 'Password must be at least 8 characters.');
      return;
    }
    if (password != _confirm.text) {
      setState(() => _error = 'Passwords do not match.');
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final auth = ref.read(patientAuthServiceProvider);
      final fcm = await TokenStorage.getFcmToken();
      final session = _reset
          ? await auth.resetPassword(
              phoneNumber: _phone.text.trim(),
              code: _code.text.trim(),
              newPassword: password,
              fcmToken: fcm,
            )
          : await auth.completeActivation(
              setupToken: _setupToken ?? '',
              password: password,
              fcmToken: fcm,
            );
      await ref.read(patientAuthProvider.notifier).adoptSession(session);
      DeviceBinding.lockPhone(_phone.text.trim());
      PendingLogin.clear();
      if (!mounted) return;
      if (!_reset) await _offerBiometric();
      if (!mounted) return;
      await context.router.replaceAll([const PatientShellRoute()]);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _busy = false;
        _error = userFacingErrorMessage(e);
      });
    }
  }

  Future<void> _signInWithProof(String password) async {
    final proof = _deviceProof;
    if (proof == null || proof.isEmpty) {
      setState(() {
        _busy = false;
        _error = 'Request a new code and try again.';
        _step = 1;
      });
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final session = await ref.read(patientAuthServiceProvider).login(
            phoneNumber: _phone.text.trim(),
            password: password,
            deviceProof: proof,
            fcmToken: await TokenStorage.getFcmToken(),
          );
      await ref.read(patientAuthProvider.notifier).adoptSession(session);
      DeviceBinding.lockPhone(_phone.text.trim());
      PendingLogin.clear();
      if (!mounted) return;
      await context.router.replaceAll([const PatientShellRoute()]);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _busy = false;
        _keptPassword = null;
        _hasPassword = true;
        _step = 2;
        _error = userFacingErrorMessage(e);
      });
    }
  }

  Future<void> _offerBiometric() async {
    if (!await BiometricAuth.canAuthenticate()) return;
    if (!mounted) return;
    final enable = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign in faster next time?'),
        content: const Text(
          'Use fingerprint or face unlock on this phone instead of typing your password.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Not now'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Turn on'),
          ),
        ],
      ),
    );
    if (enable != true) return;
    final ok = await BiometricAuth.authenticate();
    if (ok) await TokenStorage.setBiometricEnabled(true);
  }

  String get _title {
    if (_reset) return 'Reset password';
    if (_hasPassword) return 'Verify this phone';
    return 'Activate account';
  }

  String get _intro {
    if (_step == 1) {
      return _instructions ??
          'Collect your code from front desk or medical records.';
    }
    if (_step >= 2) {
      if (_reset) return 'Choose a new password for this number.';
      if (_hasPassword) return 'Enter the password for this account.';
      return 'You will use this password with your phone number next time.';
    }
    if (_reset && _phoneLocked) {
      return 'This phone stays verified for this number. Enter the date of birth on the hospital file.';
    }
    if (_keptPassword != null) {
      return 'Confirm this phone with a code. The password you just entered will be used after the code.';
    }
    if (_phoneLocked) {
      return 'Enter the date of birth on your hospital file to finish setting up this number.';
    }
    return 'Use the phone number and date of birth on your hospital file. Each phone confirms this once.';
  }

  @override
  Widget build(BuildContext context) {
    final stepTitle = switch (_step) {
      0 => 'Confirm your details',
      1 => 'Enter your code',
      _ => _reset
          ? 'Choose a new password'
          : _hasPassword
          ? 'Enter your password'
          : 'Create your password',
    };

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.white,
        ),
        title: Text(_title),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          children: [
            Text(
              stepTitle,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _intro,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.72)),
            ),
            const SizedBox(height: 24),
            if (_step == 0) ...[
              _field(
                controller: _phone,
                label: 'Phone number',
                keyboard: TextInputType.phone,
                readOnly: _phoneLocked,
              ),
              if (_phoneLocked) ...[
                const SizedBox(height: 8),
                Text(
                  _reset
                      ? 'To use a different number, go back and choose Log out of this number.'
                      : 'This code is for the number you just entered.',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.72)),
                ),
              ],
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: _busy ? null : _pickDob,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
                  minimumSize: const Size.fromHeight(52),
                ),
                child: Text(
                  _dob == null
                      ? 'Select date of birth'
                      : DateFormatter.shortDate(_dob!),
                ),
              ),
            ],
            if (_step == 1)
              _field(
                controller: _code,
                label: '6-digit code',
                keyboard: TextInputType.number,
              ),
            if (_step == 2 && _hasPassword && !_reset)
              _field(
                controller: _password,
                label: 'Password',
                obscure: _obscure,
                toggleObscure: () => setState(() => _obscure = !_obscure),
              ),
            if (_step == 2 && (!_hasPassword || _reset)) ...[
              _field(
                controller: _password,
                label: 'Password',
                obscure: _obscure,
                toggleObscure: () => setState(() => _obscure = !_obscure),
              ),
              const SizedBox(height: 12),
              _field(
                controller: _confirm,
                label: 'Confirm password',
                obscure: _obscure,
              ),
            ],
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(_error!, style: const TextStyle(color: Color(0xFFFF8A80))),
            ],
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _busy
                  ? null
                  : switch (_step) {
                      0 => _requestCode,
                      1 => _submitCode,
                      _ => _savePassword,
                    },
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
              ),
              child: _busy
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      switch (_step) {
                        0 => 'Continue',
                        1 => 'Confirm code',
                        _ => _reset
                            ? 'Save password'
                            : _hasPassword
                            ? 'Sign in'
                            : 'Activate',
                      },
                    ),
            ),
            if (_step == 0 && !_reset && !_phoneLocked)
              TextButton(
                onPressed: _busy
                    ? null
                    : () {
                        PendingLogin.clear();
                        context.router.replace(const LoginRoute());
                      },
                child: const Text('Already activated? Sign in'),
              ),
            if (_step == 1)
              TextButton(
                onPressed: _busy ? null : _requestCode,
                child: const Text('Send a new code'),
              ),
            if (_step == 2 && _hasPassword && !_reset)
              TextButton(
                onPressed: _busy
                    ? null
                    : () => setState(() {
                        _step = 0;
                        _deviceProof = null;
                        _error = null;
                      }),
                child: const Text('Request a new code'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboard,
    bool obscure = false,
    bool readOnly = false,
    VoidCallback? toggleObscure,
  }) {
    final cs = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscure,
      readOnly: readOnly,
      style: TextStyle(color: cs.onSurface),
      cursorColor: cs.primary,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: cs.onSurfaceVariant),
        floatingLabelStyle: TextStyle(color: cs.primary),
        suffixIcon: toggleObscure == null
            ? null
            : IconButton(
                onPressed: toggleObscure,
                icon: Icon(
                  obscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: cs.onSurfaceVariant,
                ),
              ),
      ),
      onChanged: (_) {
        if (_error != null) setState(() => _error = null);
      },
    );
  }
}
