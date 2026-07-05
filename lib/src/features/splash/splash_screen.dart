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

  late final AnimationController _controller;
  late final Animation<double> _logoOpacity;
  late final Animation<double> _logoScale;
  late final Animation<double> _taglineOpacity;
  late final Animation<double> _taglineSlide;
  late final Animation<double> _footerOpacity;
  late final Animation<double> _pulseScale;
  late final Animation<double> _exitOpacity;

  bool _navigating = false;

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _navigate());
      return;
    }

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    _logoOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.27, curve: Curves.easeOut),
    );
    _logoScale = Tween<double>(begin: 0.85, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.27, curve: Curves.easeOutBack),
      ),
    );
    _taglineOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.18, 0.45, curve: Curves.easeOut),
    );
    _taglineSlide = Tween<double>(begin: 12, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.18, 0.45, curve: Curves.easeOutCubic),
      ),
    );
    _footerOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.41, 0.64, curve: Curves.easeOut),
    );
    _pulseScale = TweenSequence<double>([
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
        parent: _controller,
        curve: const Interval(0.27, 0.82, curve: Curves.easeInOut),
      ),
    );
    _exitOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.91, 1, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
    _scheduleNavigation();
  }

  Future<void> _scheduleNavigation() async {
    if (kIsWeb) return;

    await Future.wait([
      Future<void>.delayed(_minDisplayDuration),
      ref.read(patientAuthProvider.notifier).restoreSession(),
    ]);

    if (!mounted || _navigating) return;

    await _controller.animateTo(
      1,
      duration: const Duration(milliseconds: 200),
    );

    if (!mounted || _navigating) return;
    await _navigate();
  }

  Future<void> _navigate() async {
    if (_navigating || !mounted) return;
    _navigating = true;

    final auth = ref.read(patientAuthProvider);
    final destination = auth.isAuthenticated
        ? const PatientShellRoute()
        : const LoginRoute();

    await context.router.replace(destination);
  }

  @override
  void dispose() {
    if (!kIsWeb) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const Scaffold(body: SizedBox.shrink());
    }

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _exitOpacity.value,
            child: SplashBranding(
              logoOpacity: _logoOpacity.value,
              logoScale: _logoScale.value,
              taglineOpacity: _taglineOpacity.value,
              taglineSlide: _taglineSlide.value,
              footerOpacity: _footerOpacity.value,
              pulseScale: _pulseScale.value,
              showPulse: _controller.value > 0.27 && _controller.value < 0.82,
            ),
          );
        },
      ),
    );
  }
}
