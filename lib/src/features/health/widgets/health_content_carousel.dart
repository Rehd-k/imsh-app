import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../core/utils/api_media_url.dart';
import '../../../models/health_content_model.dart';
import '../../../shared/widgets/imsh_solid_icon.dart';

/// Horizontal carousel of every current campaign or news item.
class HealthContentCarousel extends StatefulWidget {
  const HealthContentCarousel({
    super.key,
    required this.items,
    required this.accent,
    required this.onOpen,
    this.height = 300,
  });

  final List<HealthContentItem> items;
  final Color accent;
  final void Function(HealthContentItem item) onOpen;
  final double height;

  @override
  State<HealthContentCarousel> createState() => _HealthContentCarouselState();
}

class _HealthContentCarouselState extends State<HealthContentCarousel> {
  late final PageController _pageController;
  Timer? _autoplay;
  Timer? _resume;
  int _index = 0;
  bool _paused = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _startAutoplay();
  }

  @override
  void didUpdateWidget(covariant HealthContentCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items.length != oldWidget.items.length) {
      _index = widget.items.isEmpty
          ? 0
          : _index.clamp(0, widget.items.length - 1).toInt();
      _startAutoplay();
    }
  }

  @override
  void dispose() {
    _autoplay?.cancel();
    _resume?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoplay() {
    _autoplay?.cancel();
    if (widget.items.length < 2) return;
    _autoplay = Timer.periodic(const Duration(seconds: 6), (_) {
      if (!mounted || _paused || !_pageController.hasClients) return;
      final next = (_index + 1) % widget.items.length;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 560),
        curve: Curves.easeOutCubic,
      );
    });
  }

  void _pause() {
    _paused = true;
    _resume?.cancel();
  }

  void _scheduleResume() {
    _resume?.cancel();
    _resume = Timer(const Duration(seconds: 8), () {
      _paused = false;
    });
  }

  void _goTo(int page) {
    if (widget.items.isEmpty || !_pageController.hasClients) return;
    final next = page.clamp(0, widget.items.length - 1).toInt();
    _pageController.animateToPage(
      next,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return const SizedBox.shrink();
    final cs = context.colorScheme;
    final count = widget.items.length;

    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: Listener(
            onPointerDown: (_) => _pause(),
            onPointerUp: (_) => _scheduleResume(),
            onPointerCancel: (_) => _scheduleResume(),
            child: PageView.builder(
              controller: _pageController,
              clipBehavior: Clip.none,
              itemCount: count,
              onPageChanged: (index) => setState(() => _index = index),
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    var page = _index.toDouble();
                    if (_pageController.hasClients &&
                        _pageController.position.haveDimensions) {
                      page = _pageController.page ?? page;
                    }
                    final distance = (page - index).abs().clamp(0.0, 1.0);
                    final scale = 1 - distance * 0.045;
                    return Transform.scale(scale: scale, child: child);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(6, 8, 6, 14),
                    child: _HealthSlide(
                      item: widget.items[index],
                      accent: widget.accent,
                      onOpen: () => widget.onOpen(widget.items[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (count > 1)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                IconButton(
                  visualDensity: VisualDensity.compact,
                  tooltip: 'Previous',
                  onPressed: () => _goTo(_index == 0 ? count - 1 : _index - 1),
                  icon: const Icon(Icons.chevron_left),
                ),
                Expanded(
                  child: count <= 8
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(count, (index) {
                            final active = index == _index;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 220),
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              width: active ? 18 : 7,
                              height: 7,
                              decoration: BoxDecoration(
                                color: active
                                    ? widget.accent
                                    : cs.outlineVariant,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          }),
                        )
                      : Text(
                          '${_index + 1} / $count',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: cs.onSurfaceVariant,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  tooltip: 'Next',
                  onPressed: () => _goTo((_index + 1) % count),
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class HealthContentCarouselSection extends StatelessWidget {
  const HealthContentCarouselSection({
    super.key,
    required this.title,
    required this.icon,
    required this.accent,
    required this.items,
    required this.onViewAll,
    required this.onOpen,
  });

  final String title;
  final IconData icon;
  final Color accent;
  final List<HealthContentItem> items;
  final VoidCallback onViewAll;
  final void Function(HealthContentItem item) onOpen;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            ImshSolidIcon(
              icon: icon,
              color: accent,
              size: 26,
              iconSize: 14,
              radius: 7,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            TextButton(onPressed: onViewAll, child: const Text('View all')),
          ],
        ),
        HealthContentCarousel(
          items: items,
          accent: accent,
          onOpen: onOpen,
        ),
      ],
    );
  }
}

class _HealthSlide extends StatelessWidget {
  const _HealthSlide({
    required this.item,
    required this.accent,
    required this.onOpen,
  });

  final HealthContentItem item;
  final Color accent;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final radius = BorderRadius.circular(AppDesignTokens.radiusXl);
    final imageUrl = resolveApiMediaUrl(item.imageUrl);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: context.cardShadow,
      ),
      child: Material(
        color: cs.surfaceContainerLowest,
        borderRadius: radius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onOpen,
          child: imageUrl == null
              ? _TextSlide(item: item, accent: accent)
              : _ImageSlide(item: item, imageUrl: imageUrl, accent: accent),
        ),
      ),
    );
  }
}

class _ImageSlide extends StatelessWidget {
  const _ImageSlide({
    required this.item,
    required this.imageUrl,
    required this.accent,
  });

  final HealthContentItem item;
  final String imageUrl;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = context.colorScheme;
    final showCaption = item.hasTitle || item.hasBody;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  accent.withValues(alpha: 0.14),
                  cs.surfaceContainerLow,
                ],
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
              placeholder: (_, _) => const Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (_, _, _) => Icon(
                Icons.broken_image_outlined,
                color: cs.onSurfaceVariant,
              ),
            ),
          ),
        ),
        if (showCaption)
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item.hasTitle)
                  Text(
                    item.title.trim(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                if (item.hasBody) ...[
                  if (item.hasTitle) const SizedBox(height: 4),
                  Text(
                    item.excerpt,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.35,
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}

class _TextSlide extends StatelessWidget {
  const _TextSlide({required this.item, required this.accent});

  final HealthContentItem item;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deep = Color.lerp(accent, const Color(0xFF0F172A), 0.42)!;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [accent, deep],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 18,
              ),
            ),
            const Spacer(),
            Text(
              item.displayTitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                height: 1.15,
              ),
            ),
            if (item.hasBody) ...[
              const SizedBox(height: 8),
              Text(
                item.excerpt,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                  height: 1.35,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
