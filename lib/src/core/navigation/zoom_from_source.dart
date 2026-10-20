import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import '../theme/app_design_tokens.dart';

/// Remembers the tile that opened the next route so the page can grow from it.
abstract final class ZoomSource {
  static const duration = Duration(milliseconds: 480);
  static const reverseDuration = Duration(milliseconds: 400);

  static Rect? _pendingGlobal;
  static DateTime? _pendingAt;
  static final Map<Route<dynamic>, Rect> _byRoute = {};

  static void capture(BuildContext context) {
    final box = context.findRenderObject();
    if (box is! RenderBox || !box.attached || !box.hasSize) {
      _pendingGlobal = null;
      _pendingAt = null;
      return;
    }
    _pendingGlobal = box.localToGlobal(Offset.zero) & box.size;
    _pendingAt = DateTime.now();
  }

  /// Global rect for [route], consumed once from the latest [capture].
  static Rect? claim(Route<dynamic> route, BuildContext context) {
    var global = _byRoute[route];
    final pending = _pendingGlobal;
    final fresh =
        _pendingAt != null &&
        DateTime.now().difference(_pendingAt!) < const Duration(seconds: 1);
    if (global == null && pending != null && fresh) {
      global = pending;
      _pendingGlobal = null;
      _pendingAt = null;
      _byRoute[route] = pending;
      route.popped.whenComplete(() => _byRoute.remove(route));
    } else if (global == null) {
      _pendingGlobal = null;
      _pendingAt = null;
    }
    if (global == null || global.width < 1 || global.height < 1) {
      return null;
    }
    return _toOverlay(context, global);
  }

  static Rect? _toOverlay(BuildContext context, Rect global) {
    final overlay = Navigator.of(context).overlay?.context.findRenderObject();
    if (overlay is! RenderBox || !overlay.hasSize) return global;
    final topLeft = overlay.globalToLocal(global.topLeft);
    final rect = topLeft & global.size;
    if (rect.width < 1 || rect.height < 1) return null;
    return rect;
  }
}

/// Grows [child] out of the tapped tile. Falls back to the theme transition
/// when the page was not opened from a tile.
Widget zoomFromSourceTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final route = ModalRoute.of(context);
  final source = route == null ? null : ZoomSource.claim(route, context);
  if (source == null) {
    if (route is PageRoute<dynamic>) {
      return Theme.of(context).pageTransitionsTheme.buildTransitions(
        route,
        context,
        animation,
        secondaryAnimation,
        child,
      );
    }
    return child;
  }
  return _ZoomFromSource(
    animation: animation,
    source: source,
    child: child,
  );
}

class _ZoomFromSource extends StatefulWidget {
  const _ZoomFromSource({
    required this.animation,
    required this.source,
    required this.child,
  });

  final Animation<double> animation;
  final Rect source;
  final Widget child;

  @override
  State<_ZoomFromSource> createState() => _ZoomFromSourceState();
}

class _ZoomFromSourceState extends State<_ZoomFromSource> {
  late CurvedAnimation _curved;

  @override
  void initState() {
    super.initState();
    _curved = _curve(widget.animation);
  }

  @override
  void didUpdateWidget(covariant _ZoomFromSource oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animation == widget.animation) return;
    _curved.dispose();
    _curved = _curve(widget.animation);
  }

  @override
  void dispose() {
    _curved.dispose();
    super.dispose();
  }

  CurvedAnimation _curve(Animation<double> animation) {
    return CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;

    return AnimatedBuilder(
      animation: _curved,
      builder: (context, child) {
        final t = _curved.value.clamp(0.0, 1.0);
        final overlay = Navigator.of(context).overlay?.context.findRenderObject();
        final canvas = overlay is RenderBox && overlay.hasSize
            ? overlay.size
            : MediaQuery.sizeOf(context);
        final destination = Offset.zero & canvas;
        final rect = Rect.lerp(widget.source, destination, t)!;
        final radius = lerpDouble(AppDesignTokens.radiusMd, 0, t)!;
        final fade = ((t - 0.5) / 0.5).clamp(0.0, 1.0);
        final scale = (rect.width / canvas.width).clamp(0.01, 1.0);

        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fromRect(
              rect: rect,
              child: Material(
                color: surface,
                elevation: lerpDouble(6, 0, t)!,
                shadowColor: const Color(0x33000000),
                borderRadius: BorderRadius.circular(radius),
                clipBehavior: Clip.antiAlias,
                child: OverflowBox(
                  alignment: Alignment.topCenter,
                  minWidth: canvas.width,
                  maxWidth: canvas.width,
                  minHeight: canvas.height,
                  maxHeight: canvas.height,
                  child: Transform.scale(
                    alignment: Alignment.topCenter,
                    scale: scale,
                    child: Opacity(opacity: fade, child: child),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      child: widget.child,
    );
  }
}
