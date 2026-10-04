import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:video_player/video_player.dart';

import '../../core/responsive.dart';
import '../../helper/date_formatter.dart';
import '../../providers/auth_provider.dart';
import '../../providers/login_clock_provider.dart';
import '../../providers/theme_mode_provider.dart';
import '../../shared/widgets/feature_placeholder_screen.dart';
import 'login_video_source.dart';

const _kLogoAsset = 'assets/imsh.png';
const _kLoginVideoAsset = 'assets/login.mp4';
const _kFormMaxWidth = 420.0;
const _kSystemBlue = Color(0xFF007AFF);
const _kSystemRed = Color(0xFFFF453A);
const _kFieldFill = Color(0x1AFFFFFF);
const _kFieldBorder = Color(0x29FFFFFF);

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with TickerProviderStateMixin {
  final _patientIdController = TextEditingController();
  final _patientIdFocus = FocusNode();
  final _dobFocus = FocusNode();

  late final AnimationController _enter;
  late final AnimationController _shake;
  late final Animation<double> _shakeX;

  var _redirecting = false;

  @override
  void initState() {
    super.initState();
    _enter = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 560),
    )..forward();
    _shake = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
    _shakeX = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -12), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -12, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: -7), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -7, end: 4), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 4, end: 0), weight: 1),
    ]).animate(_shake);
  }

  @override
  void dispose() {
    _enter.dispose();
    _shake.dispose();
    _patientIdController.dispose();
    _patientIdFocus.dispose();
    _dobFocus.dispose();
    super.dispose();
  }

  Future<void> _pickDob() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 120, now.month, now.day);
    final last = DateTime(now.year, now.month, now.day, 23, 59, 59);
    final current = ref.read(loginDraftProvider).dob;
    final initial = _clampDate(
      current ?? DateTime(now.year - 30, now.month, now.day),
      first,
      last,
    );

    _dobFocus.requestFocus();
    final picked = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (sheetContext) {
        return _DobPickerSheet(
          initialDate: initial,
          firstDate: first,
          lastDate: last,
        );
      },
    );
    if (!mounted) return;
    _dobFocus.unfocus();
    if (picked == null) return;

    ref
        .read(loginDraftProvider.notifier)
        .setDob(DateTime(picked.year, picked.month, picked.day));
    ref.read(patientAuthProvider.notifier).clearError();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    ref.read(patientAuthProvider.notifier).clearError();

    final valid = ref
        .read(loginDraftProvider.notifier)
        .validate(patientId: _patientIdController.text);
    if (!valid) {
      await _shake.forward(from: 0);
      return;
    }

    final dob = ref.read(loginDraftProvider).dob!;
    final success = await ref
        .read(patientAuthProvider.notifier)
        .login(patientId: _patientIdController.text, dob: dob);

    if (!mounted || !success) return;
    final auth = ref.read(patientAuthProvider);
    if (auth.isDevicePending) {
      await context.router.replace(const DevicePendingRoute());
    } else {
      await context.router.replace(const PatientShellRoute());
    }
  }

  void _maybeRedirectIfAuthenticated(PatientAuthState auth) {
    if (_redirecting || !auth.isAuthenticated || auth.isLoading) return;
    _redirecting = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final destination = auth.isDeviceApproved
          ? const PatientShellRoute()
          : const DevicePendingRoute();
      await context.router.replace(destination);
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(patientAuthProvider);
    final draft = ref.watch(loginDraftProvider);
    _maybeRedirectIfAuthenticated(auth);

    final theme = Theme.of(context);
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const _LoginVideoBackground(),
          SafeArea(
            bottom: false,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final bp = AppBreakpoints.fromWidth(constraints.maxWidth);
                final padTop = bp.isMobile ? 12.0 : 20.0;
                final padBottom =
                    bp.paddingV +
                    bottomInset +
                    MediaQuery.viewPaddingOf(context).bottom;
                final minHeight = (constraints.maxHeight - padTop - padBottom)
                    .clamp(0.0, double.infinity);
                final fadeLift = (constraints.maxHeight * 0.46).clamp(
                  180.0,
                  460.0,
                );

                return Stack(
                  children: [
                    SingleChildScrollView(
                      reverse: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: EdgeInsets.fromLTRB(
                        bp.paddingH,
                        padTop,
                        bp.paddingH,
                        padBottom,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: minHeight),
                        child: AnimatedBuilder(
                          animation: _enter,
                          builder: (context, child) {
                            final t = Curves.easeOutCubic.transform(
                              _enter.value,
                            );
                            return Opacity(
                              opacity: t,
                              child: Transform.translate(
                                offset: Offset(0, 16 * (1 - t)),
                                child: child,
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: _kFormMaxWidth,
                                  ),
                                  child: _brandHeader(theme),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: _kFormMaxWidth,
                                  ),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        top: -fadeLift,
                                        left: -bp.paddingH,
                                        right: -bp.paddingH,
                                        bottom: -padBottom,
                                        child: const _WelcomeFade(),
                                      ),
                                      Column(
                                        children: [
                                          _loginCard(
                                            theme: theme,
                                            auth: auth,
                                            draft: draft,
                                          ),
                                          const SizedBox(height: 14),
                                          _EmergencyButton(
                                            loading: auth.isLoading,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 4,
                      right: 12,
                      child: _FrostedThemeButton(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _brandHeader(ThemeData theme) {
    return Column(
      children: [
        Semantics(
          label: 'Ibom Specialist Hospital logo',
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.16),
                  blurRadius: 36,
                  spreadRadius: -6,
                ),
              ],
            ),
            child: Image.asset(
              _kLogoAsset,
              width: 200,
              height: 84,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                width: 72,
                height: 72,
                child: Icon(
                  CupertinoIcons.heart_circle,
                  color: Colors.white,
                  size: 56,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Ibom Specialist Hospital',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.4,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Patient Portal',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.white.withValues(alpha: 0.60),
            fontWeight: FontWeight.w500,
            fontSize: 16,
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }

  Widget _loginCard({
    required ThemeData theme,
    required PatientAuthState auth,
    required LoginDraftState draft,
  }) {
    final loading = auth.isLoading;
    final hintStyle = theme.textTheme.bodyLarge?.copyWith(
      color: Colors.white.withValues(alpha: 0.45),
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0.2,
    );
    final valueStyle = theme.textTheme.bodyLarge?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 0.4,
    );

    return AnimatedBuilder(
      animation: _shakeX,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_shakeX.value, 0),
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.plus_circle,
                size: 30,
                color: Colors.white.withValues(alpha: 0.9),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.3,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Sign in with your patient ID and date of birth',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        height: 1.3,
                        color: Colors.white.withValues(alpha: 0.64),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: loading ? 0.45 : 1,
            child: IgnorePointer(
              ignoring: loading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _FieldLabel(text: 'Patient ID'),
                  const SizedBox(height: 6),
                  _SoftField(
                    focusNode: _patientIdFocus,
                    fillColor: _kFieldFill,
                    idleBorderColor: _kFieldBorder,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 48),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const _IdBadge(),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _patientIdController,
                              focusNode: _patientIdFocus,
                              textCapitalization: TextCapitalization.characters,
                              autocorrect: false,
                              enableSuggestions: false,
                              smartDashesType: SmartDashesType.disabled,
                              smartQuotesType: SmartQuotesType.disabled,
                              autofillHints: const [AutofillHints.username],
                              textInputAction: TextInputAction.next,
                              cursorColor: _kSystemBlue,
                              scrollPadding: const EdgeInsets.only(bottom: 24),
                              style: valueStyle,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z0-9\-_/]'),
                                ),
                                TextInputFormatter.withFunction((
                                  oldValue,
                                  newValue,
                                ) {
                                  return newValue.copyWith(
                                    text: newValue.text.toUpperCase(),
                                    selection: newValue.selection,
                                  );
                                }),
                              ],
                              decoration: InputDecoration(
                                isDense: true,
                                filled: false,
                                hintText: 'ISH-2024-XXXX',
                                hintStyle: hintStyle,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.fromLTRB(
                                  0,
                                  14,
                                  14,
                                  14,
                                ),
                              ),
                              onChanged: (_) {
                                ref
                                    .read(loginDraftProvider.notifier)
                                    .clearPatientIdError();
                                ref
                                    .read(patientAuthProvider.notifier)
                                    .clearError();
                              },
                              onSubmitted: (_) => _pickDob(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _InlineError(message: draft.patientIdError),
                  const SizedBox(height: 12),
                  const _FieldLabel(text: 'Date of birth'),
                  const SizedBox(height: 6),
                  _SoftField(
                    focusNode: _dobFocus,
                    fillColor: _kFieldFill,
                    idleBorderColor: _kFieldBorder,
                    child: Semantics(
                      button: true,
                      label: draft.dob == null
                          ? 'Date of birth, not selected'
                          : 'Date of birth, ${DateFormatter.shortDate(draft.dob!)}',
                      excludeSemantics: true,
                      onTap: _pickDob,
                      child: Focus(
                        focusNode: _dobFocus,
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: _pickDob,
                            borderRadius: BorderRadius.circular(12),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(minHeight: 48),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 12,
                                ),
                                child: Row(
                                  children: [
                                    const _CalendarBadge(),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        draft.dob == null
                                            ? 'Select your date of birth'
                                            : DateFormatter.shortDate(
                                                draft.dob!,
                                              ),
                                        style: draft.dob == null
                                            ? hintStyle
                                            : valueStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  _InlineError(message: draft.dobError),
                ],
              ),
            ),
          ),
          _InlineError(message: auth.error),
          const SizedBox(height: 16),
          _SignInButton(loading: loading, onPressed: _submit),
          const SizedBox(height: 12),
          Text(
            'New phone? Front desk will approve this device.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 12,
              height: 1.35,
              color: Colors.white.withValues(alpha: 0.55),
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Colors.white.withValues(alpha: 0.72),
      ),
    );
  }
}

class _InlineError extends StatelessWidget {
  const _InlineError({required this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      alignment: Alignment.centerLeft,
      child: message == null
          ? const SizedBox(width: double.infinity)
          : Padding(
              padding: const EdgeInsets.only(top: 6, left: 4),
              child: Semantics(
                liveRegion: true,
                child: Text(
                  message!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: _kSystemRed,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
              ),
            ),
    );
  }
}

class _SoftField extends StatefulWidget {
  const _SoftField({
    required this.focusNode,
    required this.fillColor,
    required this.idleBorderColor,
    required this.child,
  });

  final FocusNode focusNode;
  final Color fillColor;
  final Color idleBorderColor;
  final Widget child;

  @override
  State<_SoftField> createState() => _SoftFieldState();
}

class _SoftFieldState extends State<_SoftField> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocus);
  }

  @override
  void didUpdateWidget(covariant _SoftField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode.removeListener(_onFocus);
      widget.focusNode.addListener(_onFocus);
    }
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocus);
    super.dispose();
  }

  void _onFocus() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final focused = widget.focusNode.hasFocus;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: widget.fillColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: focused ? _kSystemBlue : widget.idleBorderColor,
        ),
      ),
      child: widget.child,
    );
  }
}

class _IdBadge extends StatelessWidget {
  const _IdBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _kSystemBlue.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        CupertinoIcons.person_crop_rectangle,
        size: 15,
        color: _kSystemBlue,
      ),
    );
  }
}

class _CalendarBadge extends StatelessWidget {
  const _CalendarBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF0D9488).withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        CupertinoIcons.calendar,
        size: 15,
        color: Color(0xFF0D9488),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({required this.loading, required this.onPressed});

  final bool loading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      button: true,
      enabled: !loading,
      label: loading ? 'Signing in' : 'Sign in',
      excludeSemantics: true,
      onTap: loading ? null : onPressed,
      child: _SpringTap(
        enabled: !loading,
        onTap: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            gradient: const LinearGradient(
              colors: [Color(0xFF4F46E5), _kSystemBlue],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4F46E5).withValues(alpha: 0.32),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: SizedBox(
            height: 52,
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: loading
                    ? const CupertinoActivityIndicator(
                        key: ValueKey('busy'),
                        color: Colors.white,
                      )
                    : Text(
                        'Sign in',
                        key: const ValueKey('label'),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.2,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmergencyButton extends StatelessWidget {
  const _EmergencyButton({required this.loading});

  final bool loading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      button: true,
      enabled: !loading,
      label: 'Request emergency help',
      excludeSemantics: true,
      onTap: loading
          ? null
          : () => context.router.push(const GuestCreateEmergencyRequestRoute()),
      child: _SpringTap(
        enabled: !loading,
        onTap: () =>
            context.router.push(const GuestCreateEmergencyRequestRoute()),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(
                  0xFFFF3B30,
                ).withValues(alpha: loading ? 0.12 : 0.22),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: const Color(0xFFFF3B30).withValues(alpha: 0.42),
                ),
              ),
              child: SizedBox(
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.phone_circle_fill,
                      color: Colors.white.withValues(alpha: loading ? 0.5 : 1),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Request emergency help',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: Colors.white.withValues(
                          alpha: loading ? 0.5 : 1,
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SpringTap extends StatefulWidget {
  const _SpringTap({
    required this.child,
    required this.onTap,
    required this.enabled,
  });

  final Widget child;
  final VoidCallback onTap;
  final bool enabled;

  @override
  State<_SpringTap> createState() => _SpringTapState();
}

class _SpringTapState extends State<_SpringTap>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scale;

  @override
  void initState() {
    super.initState();
    _scale = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 90),
      reverseDuration: const Duration(milliseconds: 420),
      value: 0,
    );
  }

  @override
  void dispose() {
    _scale.dispose();
    super.dispose();
  }

  void _down() {
    _scale.animateTo(1, curve: Curves.easeOut);
  }

  void _up() {
    _scale.animateTo(
      0,
      duration: const Duration(milliseconds: 420),
      curve: Curves.elasticOut,
    );
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: widget.enabled ? (_) => _down() : null,
      onTapUp: widget.enabled ? (_) => _up() : null,
      onTapCancel: widget.enabled ? () => _scale.animateTo(0) : null,
      child: AnimatedBuilder(
        animation: _scale,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 - (0.035 * _scale.value),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

class _FrostedThemeButton extends ConsumerWidget {
  const _FrostedThemeButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final platform = MediaQuery.platformBrightnessOf(context);
    final dark = switch (mode) {
      ThemeMode.dark => true,
      ThemeMode.light => false,
      ThemeMode.system => platform == Brightness.dark,
    };

    return Semantics(
      button: true,
      label: 'Appearance',
      excludeSemantics: true,
      onTap: () => _chooseTheme(context, ref),
      child: Tooltip(
        message: 'Appearance',
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withValues(alpha: 0.22)),
          ),
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Material(
                color: Colors.white.withValues(alpha: 0.10),
                child: InkWell(
                  onTap: () => _chooseTheme(context, ref),
                  customBorder: const CircleBorder(),
                  child: Icon(
                    dark
                        ? CupertinoIcons.moon_fill
                        : CupertinoIcons.sun_max_fill,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _chooseTheme(BuildContext context, WidgetRef ref) async {
    final current = ref.read(themeModeProvider);
    final selected = await showCupertinoModalPopup<ThemeMode>(
      context: context,
      builder: (sheetContext) {
        return CupertinoActionSheet(
          title: const Text('Appearance'),
          actions: [
            _themeAction(
              sheetContext,
              label: 'Light',
              mode: ThemeMode.light,
              selected: current,
            ),
            _themeAction(
              sheetContext,
              label: 'Dark',
              mode: ThemeMode.dark,
              selected: current,
            ),
            _themeAction(
              sheetContext,
              label: 'System',
              mode: ThemeMode.system,
              selected: current,
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.of(sheetContext).pop(),
            child: const Text('Cancel'),
          ),
        );
      },
    );
    if (selected == null || !context.mounted) return;
    await ref.read(themeModeProvider.notifier).setThemeMode(selected);
  }

  CupertinoActionSheetAction _themeAction(
    BuildContext sheetContext, {
    required String label,
    required ThemeMode mode,
    required ThemeMode selected,
  }) {
    return CupertinoActionSheetAction(
      isDefaultAction: mode == selected,
      onPressed: () => Navigator.of(sheetContext).pop(mode),
      child: Text(label),
    );
  }
}

class _WelcomeFade extends StatelessWidget {
  const _WelcomeFade();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x00000000), Color(0xFF000000)],
                stops: [0, 0.42],
              ).createShader(rect);
            },
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
              child: const SizedBox.expand(),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x000F172A),
                  Color(0x730F172A),
                  Color(0xE60F172A),
                  Color(0xFF0F172A),
                ],
                stops: [0, 0.18, 0.46, 0.72],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginVideoBackground extends StatefulWidget {
  const _LoginVideoBackground();

  @override
  State<_LoginVideoBackground> createState() => _LoginVideoBackgroundState();
}

class _LoginVideoBackgroundState extends State<_LoginVideoBackground>
    with SingleTickerProviderStateMixin {
  VideoPlayerController? _controller;
  late final AnimationController _gradient;
  var _ready = false;

  @override
  void initState() {
    super.initState();
    _gradient = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
    _start();
  }

  Future<void> _start() async {
    VideoPlayerController? controller;
    var handedOff = false;
    try {
      controller = await openLoginVideo(_kLoginVideoAsset);
      await controller.initialize();
      if (!mounted ||
          controller.value.hasError ||
          !controller.value.isInitialized) {
        debugPrint(
          'Login video did not start: ${controller.value.errorDescription}',
        );
        return;
      }
      await controller.setLooping(true);
      await controller.setVolume(0);
      await controller.play();
      if (!mounted || controller.value.hasError) {
        debugPrint(
          'Login video playback failed: ${controller.value.errorDescription}',
        );
        return;
      }
      controller.addListener(_onVideoUpdate);
      handedOff = true;
      _gradient.stop();
      setState(() {
        _controller = controller;
        _ready = true;
      });
    } catch (error) {
      debugPrint('Login video did not start: $error');
    } finally {
      if (!handedOff) {
        await controller?.dispose();
      }
    }
  }

  void _onVideoUpdate() {
    final controller = _controller;
    if (!mounted || controller == null) return;
    final value = controller.value;
    if (value.hasError) {
      debugPrint('Login video error: ${value.errorDescription}');
      if (!_gradient.isAnimating) {
        _gradient.repeat(reverse: true);
      }
      if (_ready) setState(() => _ready = false);
      return;
    }
    if (value.isInitialized && !_ready) {
      _gradient.stop();
      setState(() => _ready = true);
    }
  }

  @override
  void dispose() {
    _gradient.dispose();
    final controller = _controller;
    controller?.removeListener(_onVideoUpdate);
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    final size = controller?.value.size ?? Size.zero;
    final videoWidth = size.width > 0 ? size.width : 1920.0;
    final videoHeight = size.height > 0 ? size.height : 1080.0;
    final showVideo =
        _ready &&
        controller != null &&
        controller.value.isInitialized &&
        !controller.value.hasError;

    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: _gradient,
            builder: (context, _) {
              final t = _gradient.value;
              return Stack(
                fit: StackFit.expand,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-0.8 + t, -1),
                        end: Alignment(1, 0.6 + (0.4 * t)),
                        colors: const [
                          Color(0xFF0F172A),
                          Color(0xFF1E1B4B),
                          Color(0xFF0F766E),
                        ],
                        stops: [0, 0.48, 1],
                      ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment(0.35 - t, -0.25),
                        radius: 1.15,
                        colors: [
                          const Color(0xFF312E81).withValues(alpha: 0.55),
                          const Color(0x000F172A),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          if (showVideo)
            FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: videoWidth,
                height: videoHeight,
                child: VideoPlayer(controller),
              ),
            ),
        ],
      ),
    );
  }
}

class _DobPickerSheet extends StatefulWidget {
  const _DobPickerSheet({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  });

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  @override
  State<_DobPickerSheet> createState() => _DobPickerSheetState();
}

class _DobPickerSheetState extends State<_DobPickerSheet> {
  late DateTime _selected = widget.initialDate;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = isDark ? const Color(0xFF1C1C1E) : Colors.white;
    final label = isDark ? Colors.white : const Color(0xFF0F172A);

    return CupertinoTheme(
      data: CupertinoThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primaryColor: _kSystemBlue,
      ),
      child: Container(
        height: 320,
        decoration: BoxDecoration(
          color: background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancel', style: TextStyle(color: label)),
                  ),
                  const Spacer(),
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    onPressed: () => Navigator.of(context).pop(_selected),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color: _kSystemBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: widget.initialDate,
                minimumDate: widget.firstDate,
                maximumDate: widget.lastDate,
                onDateTimeChanged: (value) => _selected = value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DateTime _clampDate(DateTime value, DateTime first, DateTime last) {
  if (value.isBefore(first)) return first;
  if (value.isAfter(last)) return last;
  return value;
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
