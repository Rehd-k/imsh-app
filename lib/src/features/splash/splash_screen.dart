import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../providers/auth_provider.dart';
import 'widgets/splash_branding.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  static const _minDisplayDuration = Duration(milliseconds: 2500);

  AnimationController? _controller;
  Animation<double>? _logoOpacity;
  Animation<double>? _logoScale;
  Animation<double>? _taglineOpacity;
  Animation<double>? _taglineSlide;
  Animation<double>? _footerOpacity;
  Animation<double>? _pulseScale;
  Animation<double>? _exitOpacity;

  bool _navigating = false;
  bool _staticSplash = false;

  bool get _reduceMotion => WidgetsBinding
      .instance
      .platformDispatcher
      .accessibilityFeatures
      .disableAnimations;

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _navigate());
      return;
    }

    if (_reduceMotion) {
      _staticSplash = true;
      _scheduleNavigation(reduceMotion: true);
      return;
    }

    _initAnimations();
    _controller!.forward();
    _scheduleNavigation(reduceMotion: false);
  }

  void _initAnimations() {
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );
    _controller = controller;

    _logoOpacity = CurvedAnimation(
      parent: controller,
      curve: const Interval(0, 0.27, curve: Curves.easeOut),
    );
    _logoScale = Tween<double>(begin: 0.85, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.27, curve: Curves.easeOutBack),
      ),
    );
    _taglineOpacity = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.18, 0.45, curve: Curves.easeOut),
    );
    _taglineSlide = Tween<double>(begin: 12, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.18, 0.45, curve: Curves.easeOutCubic),
      ),
    );
    _footerOpacity = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.41, 0.64, curve: Curves.easeOut),
    );
    _pulseScale =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(begin: 1, end: 1.12),
            weight: 50,
          ),
          TweenSequenceItem(
            tween: Tween<double>(begin: 1.12, end: 1),
            weight: 50,
          ),
        ]).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.27, 0.82, curve: Curves.easeInOut),
          ),
        );
    _exitOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.91, 1, curve: Curves.easeIn),
      ),
    );
  }

  Future<void> _scheduleNavigation({required bool reduceMotion}) async {
    if (kIsWeb) return;

    if (reduceMotion) {
      await ref.read(patientAuthProvider.notifier).restoreSession();
    } else {
      await Future.wait([
        Future<void>.delayed(_minDisplayDuration),
        ref.read(patientAuthProvider.notifier).restoreSession(),
      ]);
    }

    if (!mounted || _navigating) return;

    final controller = _controller;
    if (controller != null && !reduceMotion) {
      await controller.animateTo(
        1,
        duration: const Duration(milliseconds: 200),
      );
    }

    if (!mounted || _navigating) return;
    await _navigate();
  }

  Future<void> _navigate() async {
    if (_navigating || !mounted) return;
    _navigating = true;

    final auth = ref.read(patientAuthProvider);
    final PageRouteInfo destination;
    if (auth.canAccessApp) {
      destination = const PatientShellRoute();
    } else if (auth.isAuthenticated && auth.isDevicePending) {
      destination = const DevicePendingRoute();
    } else {
      destination = const LoginRoute();
    }

    await context.router.replace(destination);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const Scaffold(body: SizedBox.shrink());
    }

    if (_staticSplash) {
      return const Scaffold(body: SplashBranding());
    }

    final controller = _controller;
    if (controller == null) {
      return const Scaffold(body: SplashBranding());
    }

    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Opacity(
            opacity: _exitOpacity!.value,
            child: SplashBranding(
              logoOpacity: _logoOpacity!.value,
              logoScale: _logoScale!.value,
              taglineOpacity: _taglineOpacity!.value,
              taglineSlide: _taglineSlide!.value,
              footerOpacity: _footerOpacity!.value,
              pulseScale: _pulseScale!.value,
              showPulse: controller.value > 0.27 && controller.value < 0.82,
            ),
          );
        },
      ),
    );
  }
}
