import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/duolingo_dose_colors.dart';

/// Full-width medicine row with 3D Duolingo press, check pop, and particle burst.
class DuolingoDoseButton extends StatefulWidget {
  const DuolingoDoseButton({
    super.key,
    required this.medicineName,
    required this.dosage,
    required this.onTaken,
    this.isTaken = false,
    this.enabled = true,
  });

  final String medicineName;
  final String dosage;
  final VoidCallback onTaken;
  final bool isTaken;
  final bool enabled;

  @override
  State<DuolingoDoseButton> createState() => _DuolingoDoseButtonState();
}

class _DuolingoDoseButtonState extends State<DuolingoDoseButton>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  bool _locallyTaken = false;

  late final AnimationController _animController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _checkScaleAnimation;

  bool get _taken => widget.isTaken || _locallyTaken;

  @override
  void initState() {
    super.initState();
    _locallyTaken = widget.isTaken;
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.92), weight: 30),
      TweenSequenceItem(
        tween: Tween(begin: 0.92, end: 1.05)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.05, end: 1.0)
            .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 30,
      ),
    ]).animate(_animController);
    _checkScaleAnimation = CurvedAnimation(
      parent: _animController,
      curve: const Interval(0.3, 0.9, curve: Curves.elasticOut),
    );
  }

  @override
  void didUpdateWidget(covariant DuolingoDoseButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isTaken && !_locallyTaken) {
      _locallyTaken = true;
    }
    if (!widget.isTaken && oldWidget.isTaken) {
      _locallyTaken = false;
      _animController.reset();
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> _handleDoseTaken() async {
    if (_taken || !widget.enabled) return;

    HapticFeedback.mediumImpact();
    setState(() => _locallyTaken = true);
    _animController.forward(from: 0.0);

    // Hook: optional dose "ding" via just_audio when settings allow quiet-room mute.
    await Future<void>.delayed(const Duration(milliseconds: 250));
    if (!mounted) return;
    HapticFeedback.heavyImpact();
    widget.onTaken();
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = DuolingoDoseColors.primary;
    const shadowColor = DuolingoDoseColors.bevel;

    return AnimatedBuilder(
      animation: _animController,
      builder: (context, _) {
        return Transform.scale(
          scale: _animController.isAnimating ? _scaleAnimation.value : 1.0,
          child: GestureDetector(
            onTapDown: (_) {
              if (!_taken && widget.enabled) {
                HapticFeedback.lightImpact();
                setState(() => _isPressed = true);
              }
            },
            onTapUp: (_) {
              if (!_taken && widget.enabled) {
                setState(() => _isPressed = false);
                _handleDoseTaken();
              }
            },
            onTapCancel: () => setState(() => _isPressed = false),
            child: SizedBox(
              height: 76,
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _taken ? Colors.grey.shade400 : shadowColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 60),
                    top: _isPressed || _taken ? 4 : 0,
                    left: 0,
                    right: 0,
                    bottom: _isPressed || _taken ? 2 : 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: _taken ? Colors.grey.shade200 : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: _taken
                              ? Colors.grey.shade300
                              : primaryColor.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: _taken
                                  ? Colors.grey.shade300
                                  : primaryColor.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.medication_rounded,
                              color: _taken ? Colors.grey : primaryColor,
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.medicineName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        _taken ? Colors.grey : Colors.black87,
                                    decoration: _taken
                                        ? TextDecoration.lineThrough
                                        : null,
                                  ),
                                ),
                                Text(
                                  widget.dosage,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _DoseCheckBadge(
                            isTaken: _taken,
                            progress: _animController.value,
                            checkScale: _checkScaleAnimation.value,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Full-width green 3D CTA for the next-dose hero card.
class DuolingoMarkTakenCta extends StatefulWidget {
  const DuolingoMarkTakenCta({
    super.key,
    required this.onTaken,
    this.isTaken = false,
    this.enabled = true,
    this.label = 'Mark as Taken',
  });

  final VoidCallback onTaken;
  final bool isTaken;
  final bool enabled;
  final String label;

  @override
  State<DuolingoMarkTakenCta> createState() => _DuolingoMarkTakenCtaState();
}

class _DuolingoMarkTakenCtaState extends State<DuolingoMarkTakenCta>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  bool _locallyTaken = false;

  late final AnimationController _animController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _checkScaleAnimation;

  bool get _taken => widget.isTaken || _locallyTaken;

  @override
  void initState() {
    super.initState();
    _locallyTaken = widget.isTaken;
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.96), weight: 30),
      TweenSequenceItem(
        tween: Tween(begin: 0.96, end: 1.04)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.04, end: 1.0)
            .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 30,
      ),
    ]).animate(_animController);
    _checkScaleAnimation = CurvedAnimation(
      parent: _animController,
      curve: const Interval(0.3, 0.9, curve: Curves.elasticOut),
    );
  }

  @override
  void didUpdateWidget(covariant DuolingoMarkTakenCta oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isTaken && !_locallyTaken) {
      _locallyTaken = true;
    }
    if (!widget.isTaken && oldWidget.isTaken) {
      _locallyTaken = false;
      _animController.reset();
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> _handleTaken() async {
    if (_taken || !widget.enabled) return;
    HapticFeedback.mediumImpact();
    setState(() => _locallyTaken = true);
    _animController.forward(from: 0.0);
    // Hook: optional dose "ding" via just_audio when settings allow quiet-room mute.
    await Future<void>.delayed(const Duration(milliseconds: 250));
    if (!mounted) return;
    HapticFeedback.heavyImpact();
    widget.onTaken();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animController,
      builder: (context, _) {
        return Transform.scale(
          scale: _animController.isAnimating ? _scaleAnimation.value : 1.0,
          child: GestureDetector(
            onTapDown: (_) {
              if (!_taken && widget.enabled) {
                HapticFeedback.lightImpact();
                setState(() => _isPressed = true);
              }
            },
            onTapUp: (_) {
              if (!_taken && widget.enabled) {
                setState(() => _isPressed = false);
                _handleTaken();
              }
            },
            onTapCancel: () => setState(() => _isPressed = false),
            child: SizedBox(
              height: 52,
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _taken
                            ? Colors.grey.shade400
                            : DuolingoDoseColors.bevel,
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 60),
                    top: _isPressed || _taken ? 4 : 0,
                    left: 0,
                    right: 0,
                    bottom: _isPressed || _taken ? 1 : 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _taken
                            ? Colors.grey.shade300
                            : DuolingoDoseColors.primary,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomPaint(
                            painter: _taken
                                ? ParticleBurstPainter(
                                    progress: _animController.value,
                                  )
                                : null,
                            child: Transform.scale(
                              scale:
                                  _taken ? _checkScaleAnimation.value : 1.0,
                              child: Icon(
                                _taken
                                    ? Icons.check_rounded
                                    : Icons.check_circle_outline,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _taken ? 'Taken' : widget.label,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Compact check control for calendar / by-drug list rows.
class DuolingoDoseCheckControl extends StatefulWidget {
  const DuolingoDoseCheckControl({
    super.key,
    required this.onTaken,
    this.isTaken = false,
    this.enabled = true,
  });

  final VoidCallback onTaken;
  final bool isTaken;
  final bool enabled;

  @override
  State<DuolingoDoseCheckControl> createState() =>
      _DuolingoDoseCheckControlState();
}

class _DuolingoDoseCheckControlState extends State<DuolingoDoseCheckControl>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  bool _locallyTaken = false;

  late final AnimationController _animController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _checkScaleAnimation;

  bool get _taken => widget.isTaken || _locallyTaken;

  @override
  void initState() {
    super.initState();
    _locallyTaken = widget.isTaken;
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.88), weight: 30),
      TweenSequenceItem(
        tween: Tween(begin: 0.88, end: 1.12)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.12, end: 1.0)
            .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 30,
      ),
    ]).animate(_animController);
    _checkScaleAnimation = CurvedAnimation(
      parent: _animController,
      curve: const Interval(0.3, 0.9, curve: Curves.elasticOut),
    );
  }

  @override
  void didUpdateWidget(covariant DuolingoDoseCheckControl oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isTaken && !_locallyTaken) {
      _locallyTaken = true;
    }
    if (!widget.isTaken && oldWidget.isTaken) {
      _locallyTaken = false;
      _animController.reset();
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> _handleTaken() async {
    if (_taken || !widget.enabled) return;
    HapticFeedback.mediumImpact();
    setState(() => _locallyTaken = true);
    _animController.forward(from: 0.0);
    // Hook: optional dose "ding" via just_audio when settings allow quiet-room mute.
    await Future<void>.delayed(const Duration(milliseconds: 250));
    if (!mounted) return;
    HapticFeedback.heavyImpact();
    widget.onTaken();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animController,
      builder: (context, _) {
        return Transform.scale(
          scale: _animController.isAnimating ? _scaleAnimation.value : 1.0,
          child: GestureDetector(
            onTapDown: (_) {
              if (!_taken && widget.enabled) {
                HapticFeedback.lightImpact();
                setState(() => _isPressed = true);
              }
            },
            onTapUp: (_) {
              if (!_taken && widget.enabled) {
                setState(() => _isPressed = false);
                _handleTaken();
              }
            },
            onTapCancel: () => setState(() => _isPressed = false),
            child: SizedBox(
              width: 44,
              height: 44,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: _isPressed || _taken ? 4 : 2,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: _taken
                            ? Colors.grey.shade400
                            : DuolingoDoseColors.bevel,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 60),
                    top: _isPressed || _taken ? 4 : 0,
                    child: _DoseCheckBadge(
                      isTaken: _taken,
                      progress: _animController.value,
                      checkScale: _checkScaleAnimation.value,
                      size: 36,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DoseCheckBadge extends StatelessWidget {
  const _DoseCheckBadge({
    required this.isTaken,
    required this.progress,
    required this.checkScale,
    this.size = 36,
  });

  final bool isTaken;
  final double progress;
  final double checkScale;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: isTaken ? ParticleBurstPainter(progress: progress) : null,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isTaken ? DuolingoDoseColors.primary : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: isTaken ? DuolingoDoseColors.primary : Colors.grey.shade400,
            width: 2.5,
          ),
        ),
        child: isTaken
            ? Transform.scale(
                scale: checkScale,
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              )
            : null,
      ),
    );
  }
}

class ParticleBurstPainter extends CustomPainter {
  ParticleBurstPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress == 0.0 || progress > 0.8) return;

    final paint = Paint()..style = PaintingStyle.fill;
    final center = Offset(size.width / 2, size.height / 2);
    const particleCount = 8;
    final maxDistance = size.width * 1.1;

    for (var i = 0; i < particleCount; i++) {
      final angle = (i * 2 * pi) / particleCount;
      final distance = progress * maxDistance;
      final offset = Offset(
        center.dx + cos(angle) * distance,
        center.dy + sin(angle) * distance,
      );

      final radius = (1.0 - progress) * 3.5;
      paint.color = (i.isEven
              ? DuolingoDoseColors.particleGold
              : DuolingoDoseColors.primary)
          .withValues(alpha: (1.0 - progress).clamp(0.0, 1.0));

      canvas.drawCircle(offset, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant ParticleBurstPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
