import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/context_extensions.dart';
import '../../helper/date_formatter.dart';
import '../../providers/auth_provider.dart';
import '../../shared/widgets/feature_placeholder_screen.dart';
import '../../shared/widgets/imsh_surface_card.dart';
import '../../shared/widgets/theme_mode_menu_button.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _patientIdController = TextEditingController();

  DateTime? _dob;
  bool _showDobError = false;
  bool _redirecting = false;

  @override
  void dispose() {
    _patientIdController.dispose();
    super.dispose();
  }

  Future<void> _pickDob() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime(now.year - 30),
      firstDate: DateTime(now.year - 120),
      lastDate: now,
      helpText: 'Select date of birth',
    );
    if (picked != null) {
      setState(() {
        _dob = picked;
        _showDobError = false;
      });
      ref.read(patientAuthProvider.notifier).clearError();
    }
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    ref.read(patientAuthProvider.notifier).clearError();

    final isValid = _formKey.currentState?.validate() ?? false;
    if (_dob == null) {
      setState(() => _showDobError = true);
    }
    if (!isValid || _dob == null) {
      return;
    }

    final success = await ref.read(patientAuthProvider.notifier).login(
          patientId: _patientIdController.text,
          dob: _dob!,
        );

    if (!mounted || !success) return;
    await context.router.replace(const PatientShellRoute());
  }

  void _maybeRedirectIfAuthenticated(PatientAuthState auth) {
    if (_redirecting || !auth.isAuthenticated || auth.isLoading) return;
    _redirecting = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await context.router.replace(const PatientShellRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(patientAuthProvider);
    _maybeRedirectIfAuthenticated(auth);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppDesignTokens.loginBackgroundGradient(colorScheme),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDesignTokens.containerPadding,
                    vertical: AppDesignTokens.spacingXl,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _LoginBrandingHeader(theme: theme),
                          const Gap(AppDesignTokens.spacingLg),
                          _LoginFormCard(
                            auth: auth,
                            patientIdController: _patientIdController,
                            dob: _dob,
                            showDobError: _showDobError,
                            onPickDob: _pickDob,
                            onSubmit: _submit,
                            onPatientIdChanged: () => ref
                                .read(patientAuthProvider.notifier)
                                .clearError(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 0,
                right: 8,
                child: ThemeModeMenuButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginBrandingHeader extends StatelessWidget {
  const _LoginBrandingHeader({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
            boxShadow: context.cardShadow,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
            child: Image.asset('assets/imsh.png', height: 72),
          ),
        ),
        const Gap(AppDesignTokens.spacingLg),
        Text(
          'Ibom Specialist Hospital',
          style: AppTheme.headlineLgMobile(context),
          textAlign: TextAlign.center,
        ),
        const Gap(AppDesignTokens.spacingXs),
        Text(
          'Patient Portal',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(AppDesignTokens.spacingSm),
        child,
      ],
    );
  }
}

class _LoginFormCard extends StatelessWidget {
  const _LoginFormCard({
    required this.auth,
    required this.patientIdController,
    required this.dob,
    required this.showDobError,
    required this.onPickDob,
    required this.onSubmit,
    required this.onPatientIdChanged,
  });

  final PatientAuthState auth;
  final TextEditingController patientIdController;
  final DateTime? dob;
  final bool showDobError;
  final VoidCallback onPickDob;
  final VoidCallback onSubmit;
  final VoidCallback onPatientIdChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ImshSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sign in with your hospital patient ID and date of birth.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(AppDesignTokens.spacingLg),
          _LabeledField(
            label: 'Patient ID',
            child: TextFormField(
              controller: patientIdController,
              decoration: const InputDecoration(
                hintText: 'ISH-2024-XXXX',
                prefixIcon: Icon(Icons.person_outline),
              ),
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.characters,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\-_/]')),
              ],
              enabled: !auth.isLoading,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Patient ID is required';
                }
                return null;
              },
              onChanged: (_) => onPatientIdChanged(),
            ),
          ),
          const Gap(AppDesignTokens.spacingMd),
          _LabeledField(
            label: 'Date of birth',
            child: InkWell(
              onTap: auth.isLoading ? null : onPickDob,
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
              child: InputDecorator(
                decoration: InputDecoration(
                  hintText: 'Select your date of birth',
                  prefixIcon: const Icon(Icons.calendar_today_outlined),
                  errorText: showDobError && dob == null
                      ? 'Date of birth is required'
                      : null,
                ),
                child: Text(
                  dob == null
                      ? 'Select your date of birth'
                      : DateFormatter.shortDate(dob!),
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: dob == null
                        ? colorScheme.onSurfaceVariant.withValues(alpha: 0.6)
                        : colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
          if (auth.error != null) ...[
            const Gap(AppDesignTokens.spacingMd),
            Container(
              padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: colorScheme.onErrorContainer,
                    size: 20,
                  ),
                  const Gap(AppDesignTokens.spacingSm),
                  Expanded(
                    child: Text(
                      auth.error!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const Gap(AppDesignTokens.spacingLg),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
              boxShadow: auth.isLoading ? null : context.buttonShadow,
            ),
            child: FilledButton(
              onPressed: auth.isLoading ? null : onSubmit,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: auth.isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colorScheme.onPrimary,
                      ),
                    )
                  : const Text('Secure Sign In'),
            ),
          ),
        ],
      ),
    );
  }
}

@RoutePage()
class SessionExpiredScreen extends StatelessWidget {
  const SessionExpiredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholderScreen(
      title: 'Session expired',
      subtitle: 'Please sign in again.',
      icon: Icons.lock_clock_outlined,
    );
  }
}
