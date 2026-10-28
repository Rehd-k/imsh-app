import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/auth/biometric_auth.dart';
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
  bool _obscure = true;

  bool get _reset => widget.reset;

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
      final token = await ref.read(patientAuthServiceProvider).verifyActivation(
        phoneNumber: _phone.text.trim(),
        code: code,
      );
      if (!mounted) return;
      setState(() {
        _setupToken = token;
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

  @override
  Widget build(BuildContext context) {
    final title = _reset ? 'Reset password' : 'Activate account';
    final stepTitle = switch (_step) {
      0 => 'Confirm your details',
      1 => 'Enter your code',
      _ => _reset ? 'Choose a new password' : 'Create your password',
    };

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text(title),
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
              _step == 0
                  ? 'Use the phone number and date of birth on your hospital file.'
                  : _step == 1
                  ? (_instructions ??
                        'Collect your code from front desk or medical records.')
                  : 'You will use this password with your phone number next time.',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.72)),
            ),
            const SizedBox(height: 24),
            if (_step == 0) ...[
              _field(
                controller: _phone,
                label: 'Phone number',
                keyboard: TextInputType.phone,
              ),
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
            if (_step == 2) ...[
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
                        _ => _reset ? 'Save password' : 'Activate',
                      },
                    ),
            ),
            if (_step == 1)
              TextButton(
                onPressed: _busy ? null : _requestCode,
                child: const Text('Send a new code'),
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
    VoidCallback? toggleObscure,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.28)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: toggleObscure == null
            ? null
            : IconButton(
                onPressed: toggleObscure,
                icon: Icon(
                  obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: Colors.white70,
                ),
              ),
      ),
      onChanged: (_) {
        if (_error != null) setState(() => _error = null);
      },
    );
  }
}
