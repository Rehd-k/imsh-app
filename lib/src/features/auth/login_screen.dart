import 'dart:async';
import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:intl/intl.dart';

import '../../core/responsive.dart';
import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../helper/app_timezone.dart';
import '../../helper/date_formatter.dart';
import '../../providers/auth_provider.dart';
import '../../shared/widgets/adaptive_date_picker.dart';
import '../../shared/widgets/feature_placeholder_screen.dart';
import '../../shared/widgets/imsh_solid_icon.dart';
import '../../shared/widgets/imsh_surface_card.dart';
import '../../shared/widgets/theme_mode_menu_button.dart';

const _kLogoAsset = 'assets/imsh.png';
const _kFormMaxWidth = 440.0;

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
    final picked = await showAdaptiveDatePicker(
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
    if (!isValid || _dob == null) return;

    final success = await ref
        .read(patientAuthProvider.notifier)
        .login(patientId: _patientIdController.text, dob: _dob!);

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

  Widget _brandLogo({
    required double maxWidth,
    required double maxHeight,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(20)),
  }) {
    return Semantics(
      label: 'Ibom Specialist Hospital logo',
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        borderRadius: borderRadius,
        child: Padding(
          padding: padding,
          child: Image.asset(
            _kLogoAsset,
            fit: BoxFit.contain,
            width: maxWidth,
            height: maxHeight,
            filterQuality: FilterQuality.high,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.local_hospital_rounded,
              size: math.min(maxWidth, maxHeight) * 0.42,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(patientAuthProvider);
    _maybeRedirectIfAuthenticated(auth);

    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bp = AppBreakpoints.fromWidth(constraints.maxWidth);
          final form = _loginFormCard(
            theme: theme,
            colors: colors,
            auth: auth,
            compact: bp.isMobile,
            showHeroLogo: !bp.isDesktop,
          );
          final formColumn = ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _kFormMaxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                form,
                const SizedBox(height: 14),
                _emergencyButton(auth: auth, onDark: !bp.isDesktop),
              ],
            ),
          );

          if (bp.isDesktop) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 5, child: _brandingHero(theme)),
                Expanded(
                  flex: 6,
                  child: ColoredBox(
                    color: colors.surface,
                    child: Stack(
                      children: [
                        Center(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(
                              horizontal: bp.paddingH,
                              vertical: bp.paddingV,
                            ),
                            child: formColumn,
                          ),
                        ),
                        const Positioned(
                          top: 8,
                          right: 8,
                          child: ThemeModeMenuButton(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return Stack(
            fit: StackFit.expand,
            children: [
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF0F172A),
                      Color(0xFF312E81),
                      Color(0xFF0F766E),
                    ],
                  ),
                ),
              ),
              const _ColorBlobs(),
              SafeArea(
                child: Stack(
                  children: [
                    Center(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: bp.paddingH,
                          vertical: bp.paddingV,
                        ),
                        child: Column(
                          children: [
                            if (bp.isTablet) ...[
                              _compactHeroStrip(theme),
                              const SizedBox(height: 12),
                            ],
                            formColumn,
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 0,
                      right: 8,
                      child: IconTheme(
                        data: IconThemeData(color: Colors.white),
                        child: ThemeModeMenuButton(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _brandingHero(ThemeData theme) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0F172A), Color(0xFF1E1B4B), Color(0xFF134E4A)],
            ),
          ),
        ),
        const _ColorBlobs(),
        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _brandLogo(
                  maxWidth: 220,
                  maxHeight: 96,
                  padding: const EdgeInsets.all(10),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ibom Specialist Hospital',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Patient Portal',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.88),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Secure access to appointments, records, labs, and care at home.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.72),
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 16),
                const _LoginClock(onDark: true),
                const SizedBox(height: 16),
                const _ModuleTiles(compact: false),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _compactHeroStrip(ThemeData theme) {
    return Column(
      children: [
        Text(
          'Ibom Specialist Hospital',
          style: theme.textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        const _LoginClock(onDark: true),
        const SizedBox(height: 12),
        const _ModuleTiles(compact: true),
      ],
    );
  }

  InputDecoration _fieldDecoration(
    ColorScheme colors, {
    required String label,
    String? hint,
    required Widget prefixIcon,
    Widget? suffixIcon,
    String? errorText,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Padding(padding: const EdgeInsets.all(8), child: prefixIcon),
      prefixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 44),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: colors.surface,
      errorText: errorText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
        borderSide: BorderSide(color: colors.outline.withValues(alpha: 0.28)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusSm),
        borderSide: const BorderSide(color: ImshAccentColors.indigo, width: 1.6),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      labelStyle: const TextStyle(fontSize: 13),
    );
  }

  Widget _loginFormCard({
    required ThemeData theme,
    required ColorScheme colors,
    required PatientAuthState auth,
    required bool compact,
    required bool showHeroLogo,
  }) {
    return ImshSurfaceCard(
      padding: EdgeInsets.fromLTRB(16, compact ? 16 : 20, 16, 18),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showHeroLogo) ...[
              Center(
                child: _brandLogo(
                  maxWidth: 180,
                  maxHeight: 80,
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
            Row(
              children: [
                const ImshSolidIcon(
                  icon: Icons.login_rounded,
                  color: ImshAccentColors.purple,
                  size: 34,
                  iconSize: 18,
                  radius: AppDesignTokens.radiusMd,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImshEllipsisText(
                        text: 'Welcome back',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: colors.onSurface,
                        ),
                      ),
                      ImshEllipsisText(
                        text:
                            'Sign in with your patient ID and date of birth',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _patientIdController,
              decoration: _fieldDecoration(
                colors,
                label: 'Patient ID',
                hint: 'ISH-2024-XXXX',
                prefixIcon: const ImshSolidIcon(
                  icon: Icons.badge_outlined,
                  color: ImshAccentColors.blue,
                  size: 28,
                  iconSize: 16,
                  radius: 8,
                ),
              ),
              autofillHints: const [AutofillHints.username],
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.characters,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z0-9\-_/]'),
                ),
              ],
              enabled: !auth.isLoading,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Patient ID is required';
                }
                return null;
              },
              onChanged: (_) =>
                  ref.read(patientAuthProvider.notifier).clearError(),
            ),
            const SizedBox(height: 12),
            Semantics(
              button: true,
              label: _dob == null
                  ? 'Date of birth, not selected'
                  : 'Date of birth, ${DateFormatter.shortDate(_dob!)}',
              child: InkWell(
                onTap: auth.isLoading ? null : _pickDob,
                borderRadius: BorderRadius.circular(
                  AppDesignTokens.radiusSm,
                ),
                child: InputDecorator(
                  decoration: _fieldDecoration(
                    colors,
                    label: 'Date of birth',
                    hint: 'Select your date of birth',
                    prefixIcon: const ImshSolidIcon(
                      icon: Icons.calendar_today_outlined,
                      color: ImshAccentColors.teal,
                      size: 28,
                      iconSize: 16,
                      radius: 8,
                    ),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ImshSolidIcon(
                        icon: Icons.edit_calendar_outlined,
                        color: ImshAccentColors.indigo,
                        size: 28,
                        iconSize: 16,
                        radius: 8,
                      ),
                    ),
                    errorText: _showDobError && _dob == null
                        ? 'Date of birth is required'
                        : null,
                  ),
                  child: Text(
                    _dob == null
                        ? 'Select your date of birth'
                        : DateFormatter.shortDate(_dob!),
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: _dob == null
                          ? colors.onSurfaceVariant
                          : colors.onSurface,
                    ),
                  ),
                ),
              ),
            ),
            if (auth.error != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colors.errorContainer,
                  borderRadius: BorderRadius.circular(
                    AppDesignTokens.radiusSm,
                  ),
                  border: Border.all(
                    color: colors.error.withValues(alpha: 0.35),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ImshSolidIcon(
                      icon: Icons.error_outline,
                      color: ImshAccentColors.pink,
                      size: 22,
                      iconSize: 12,
                      radius: 6,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        auth.error!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 8),
            FilledButton(
              onPressed: auth.isLoading ? null : _submit,
              style: FilledButton.styleFrom(
                backgroundColor: ImshAccentColors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: const StadiumBorder(),
              ),
              child: auth.isLoading
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ImshSolidIcon(
                          icon: Icons.arrow_forward_rounded,
                          color: ImshAccentColors.pink,
                          size: 22,
                          iconSize: 14,
                          radius: 6,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Sign in',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 10),
            Text(
              'New phone? Front desk will approve this device.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emergencyButton({
    required PatientAuthState auth,
    required bool onDark,
  }) {
    return FilledButton.icon(
      onPressed: auth.isLoading
          ? null
          : () => context.router.push(const GuestCreateEmergencyRequestRoute()),
      style: FilledButton.styleFrom(
        backgroundColor: ImshAccentColors.pink,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: const StadiumBorder(),
      ),
      icon: ImshSolidIcon(
        icon: Icons.emergency_outlined,
        color: onDark ? ImshAccentColors.amber : const Color(0xFFBE185D),
        size: 22,
        iconSize: 14,
        radius: 6,
      ),
      label: const Text('Request emergency help'),
    );
  }
}

class _MovingBlob {
  _MovingBlob({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.radius,
    required this.color,
  });

  double x;
  double y;
  double vx;
  double vy;
  final double radius;
  final Color color;
}

class _ColorBlobs extends StatefulWidget {
  const _ColorBlobs();

  @override
  State<_ColorBlobs> createState() => _ColorBlobsState();
}

class _ColorBlobsState extends State<_ColorBlobs>
    with SingleTickerProviderStateMixin {
  static const _specs = <(Color, double)>[
    (ImshAccentColors.purple, 110),
    (ImshAccentColors.pink, 90),
    (ImshAccentColors.teal, 100),
    (ImshAccentColors.amber, 80),
    (ImshAccentColors.blue, 70),
  ];

  static const _minSpeed = 42.0;
  static const _maxSpeed = 130.0;

  late final Ticker _ticker;
  final math.Random _rng = math.Random(7);
  final List<_MovingBlob> _blobs = [];
  Size _size = Size.zero;
  Duration? _lastElapsed;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _spawn(Size size) {
    _blobs
      ..clear()
      ..addAll([
        for (final spec in _specs)
          _MovingBlob(
            x: spec.$2 +
                _rng.nextDouble() * math.max(1, size.width - spec.$2 * 2),
            y: spec.$2 +
                _rng.nextDouble() * math.max(1, size.height - spec.$2 * 2),
            vx: (_rng.nextBool() ? 1 : -1) * (48 + _rng.nextDouble() * 56),
            vy: (_rng.nextBool() ? 1 : -1) * (48 + _rng.nextDouble() * 56),
            radius: spec.$2,
            color: spec.$1,
          ),
      ]);
  }

  void _ensureBlobs(Size size) {
    if (size.width <= 0 || size.height <= 0) return;
    if (_blobs.isEmpty) {
      _spawn(size);
      _size = size;
      setState(() {});
      return;
    }
    if (size == _size) return;
    for (final blob in _blobs) {
      blob.x = blob.x.clamp(
        blob.radius,
        math.max(blob.radius, size.width - blob.radius),
      );
      blob.y = blob.y.clamp(
        blob.radius,
        math.max(blob.radius, size.height - blob.radius),
      );
    }
    _size = size;
  }

  void _bounceWalls(_MovingBlob blob) {
    final maxX = math.max(blob.radius, _size.width - blob.radius);
    final maxY = math.max(blob.radius, _size.height - blob.radius);
    if (blob.x < blob.radius) {
      blob.x = blob.radius;
      blob.vx = blob.vx.abs();
    } else if (blob.x > maxX) {
      blob.x = maxX;
      blob.vx = -blob.vx.abs();
    }
    if (blob.y < blob.radius) {
      blob.y = blob.radius;
      blob.vy = blob.vy.abs();
    } else if (blob.y > maxY) {
      blob.y = maxY;
      blob.vy = -blob.vy.abs();
    }
  }

  void _collide(_MovingBlob a, _MovingBlob b) {
    final dx = b.x - a.x;
    final dy = b.y - a.y;
    final distSq = dx * dx + dy * dy;
    final minDist = a.radius + b.radius;
    if (distSq >= minDist * minDist) return;

    final dist = distSq <= 0.0001 ? 0.0001 : math.sqrt(distSq);
    final nx = dx / dist;
    final ny = dy / dist;

    final overlap = minDist - dist;
    final massA = a.radius * a.radius;
    final massB = b.radius * b.radius;
    final massSum = massA + massB;
    a.x -= nx * overlap * (massB / massSum);
    a.y -= ny * overlap * (massB / massSum);
    b.x += nx * overlap * (massA / massSum);
    b.y += ny * overlap * (massA / massSum);

    final relVx = b.vx - a.vx;
    final relVy = b.vy - a.vy;
    final velAlongNormal = relVx * nx + relVy * ny;
    if (velAlongNormal > 0) return;

    const restitution = 1.0;
    final impulse = -(1 + restitution) * velAlongNormal / massSum;
    a.vx -= impulse * massB * nx;
    a.vy -= impulse * massB * ny;
    b.vx += impulse * massA * nx;
    b.vy += impulse * massA * ny;
  }

  void _clampSpeed(_MovingBlob blob) {
    final speed = math.sqrt(blob.vx * blob.vx + blob.vy * blob.vy);
    if (speed < 1) {
      blob.vx = _minSpeed * (_rng.nextBool() ? 1 : -1);
      blob.vy = _minSpeed * (_rng.nextBool() ? 1 : -1);
      return;
    }
    if (speed < _minSpeed) {
      final scale = _minSpeed / speed;
      blob.vx *= scale;
      blob.vy *= scale;
    } else if (speed > _maxSpeed) {
      final scale = _maxSpeed / speed;
      blob.vx *= scale;
      blob.vy *= scale;
    }
  }

  void _onTick(Duration elapsed) {
    if (!mounted || _size == Size.zero || _blobs.isEmpty) {
      _lastElapsed = elapsed;
      return;
    }

    final last = _lastElapsed ?? elapsed;
    _lastElapsed = elapsed;
    var dt = (elapsed - last).inMicroseconds / 1e6;
    if (dt <= 0) return;
    if (dt > 0.05) dt = 0.05;

    for (final blob in _blobs) {
      blob.x += blob.vx * dt;
      blob.y += blob.vy * dt;
      _bounceWalls(blob);
    }

    for (var i = 0; i < _blobs.length; i++) {
      for (var j = i + 1; j < _blobs.length; j++) {
        _collide(_blobs[i], _blobs[j]);
      }
    }

    for (final blob in _blobs) {
      _bounceWalls(blob);
      _clampSpeed(blob);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = Size(constraints.maxWidth, constraints.maxHeight);
          if (size.width > 0 && size.height > 0 && size != _size) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              _ensureBlobs(size);
            });
          }
          return Stack(
            children: [
              for (final blob in _blobs)
                Positioned(
                  left: blob.x - blob.radius,
                  top: blob.y - blob.radius,
                  width: blob.radius * 2,
                  height: blob.radius * 2,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: blob.color.withValues(alpha: 0.28),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ModuleTiles extends StatelessWidget {
  const _ModuleTiles({required this.compact});

  final bool compact;

  static const _tiles = <(IconData, String, Color)>[
    (Icons.event_available_outlined, 'Appointments', ImshAccentColors.purple),
    (Icons.folder_shared_outlined, 'Records', ImshAccentColors.teal),
    (Icons.biotech_outlined, 'Lab results', ImshAccentColors.indigo),
    (Icons.medication_outlined, 'Medications', ImshAccentColors.amber),
    (Icons.payments_outlined, 'Billing', ImshAccentColors.pink),
    (Icons.emergency_outlined, 'Emergency', ImshAccentColors.green),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tiles = compact ? _tiles.take(4).toList() : _tiles;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        for (final tile in tiles)
          Container(
            width: compact ? 150 : 168,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
              border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
            ),
            child: Row(
              children: [
                ImshSolidIcon(
                  icon: tile.$1,
                  color: tile.$3,
                  size: 26,
                  iconSize: 14,
                  radius: 7,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    tile.$2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _LoginClock extends StatefulWidget {
  const _LoginClock({required this.onDark});

  final bool onDark;

  @override
  State<_LoginClock> createState() => _LoginClockState();
}

class _LoginClockState extends State<_LoginClock> {
  late DateTime _now;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _now = AppTimezone.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _now = AppTimezone.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final time = DateFormat('hh:mm a').format(_now);
    final date = DateFormat('EEE, MMM d, yyyy').format(_now);
    final onDark = widget.onDark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: onDark
            ? Colors.white.withValues(alpha: 0.12)
            : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: onDark
              ? Colors.white.withValues(alpha: 0.22)
              : theme.colorScheme.outlineVariant.withValues(alpha: 0.7),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: ImshAccentColors.green,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                time,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: onDark ? Colors.white : null,
                ),
              ),
              Text(
                date,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: onDark
                      ? Colors.white.withValues(alpha: 0.7)
                      : theme.colorScheme.onSurfaceVariant,
                  fontSize: 10,
                ),
              ),
            ],
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
