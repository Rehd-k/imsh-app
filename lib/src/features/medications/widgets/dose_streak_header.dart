import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/duolingo_dose_colors.dart';

/// Flame badge + daily progress bar. Pulses when [celebrateTick] increases.
class DoseStreakHeader extends StatefulWidget {
  const DoseStreakHeader({
    super.key,
    required this.streakDays,
    required this.progressFraction,
    this.celebrateTick = 0,
  });

  final int streakDays;
  final double progressFraction;
  final int celebrateTick;

  @override
  State<DoseStreakHeader> createState() => _DoseStreakHeaderState();
}

class _DoseStreakHeaderState extends State<DoseStreakHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _flameScale;
  int _displayedStreak = 0;
  bool _hydrated = false;

  @override
  void initState() {
    super.initState();
    _displayedStreak = widget.streakDays;
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _flameScale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.3)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 45,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.3, end: 1.0)
            .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 55,
      ),
    ]).animate(_pulseController);
  }

  @override
  void didUpdateWidget(covariant DoseStreakHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.celebrateTick > oldWidget.celebrateTick) {
      _runCelebration(widget.streakDays);
      return;
    }
    // Hydrate from prefs / family switch without skipping celebration rolls.
    if (!_hydrated || widget.streakDays < _displayedStreak) {
      _displayedStreak = widget.streakDays;
      _hydrated = true;
    }
  }

  Future<void> _runCelebration(int nextStreak) async {
    HapticFeedback.heavyImpact();
    await _pulseController.forward(from: 0);
    if (!mounted) return;
    setState(() => _displayedStreak = nextStreak);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = widget.progressFraction.clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        children: [
          AnimatedBuilder(
            animation: _flameScale,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseController.isAnimating ? _flameScale.value : 1.0,
                child: child,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: DuolingoDoseColors.streakWash,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: DuolingoDoseColors.streakOrange,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  const Text('🔥', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 4),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 280),
                    transitionBuilder: (child, animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.4),
                          end: Offset.zero,
                        ).animate(animation),
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: Text(
                      '$_displayedStreak',
                      key: ValueKey(_displayedStreak),
                      style: const TextStyle(
                        color: DuolingoDoseColors.streakInk,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: progress),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return LinearProgressIndicator(
                    value: value,
                    minHeight: 14,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      DuolingoDoseColors.primary,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
