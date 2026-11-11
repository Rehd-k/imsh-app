import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/responsive.dart';
import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../core/utils/api_media_url.dart';
import '../../helper/date_formatter.dart';
import '../../models/health_content_model.dart';
import '../../providers/health_content_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_empty_state.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import '../../shared/widgets/imsh_page_header.dart';
import '../../shared/widgets/imsh_surface_card.dart';
import 'widgets/health_content_carousel.dart';

@RoutePage()
class HealthCampaignsScreen extends ConsumerWidget {
  const HealthCampaignsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(healthCampaignsProvider);
    return Scaffold(
      appBar: const ImshAppBar(title: Text('Health campaigns')),
      body: _HealthContentListBody(
        async: async,
        title: 'Health campaigns',
        subtitle: 'Hospital programmes and community health initiatives.',
        icon: Icons.campaign_outlined,
        iconColor: ImshAccentColors.green,
        emptyLabel: 'No campaigns right now.',
        onRetry: () => ref.invalidate(healthCampaignsProvider),
        onRefresh: () async {
          ref.invalidate(healthCampaignsProvider);
          await ref.read(healthCampaignsProvider.future);
        },
        onOpen: (item) =>
            context.router.push(HealthCampaignDetailRoute(id: item.id)),
      ),
    );
  }
}

@RoutePage()
class HealthNewsScreen extends ConsumerWidget {
  const HealthNewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(healthNewsProvider);
    return Scaffold(
      appBar: const ImshAppBar(title: Text('Health news')),
      body: _HealthContentListBody(
        async: async,
        title: 'Health news',
        subtitle: 'Articles and updates from Ibom Multi-Specialty Hospital.',
        icon: Icons.newspaper_outlined,
        iconColor: ImshAccentColors.blue,
        emptyLabel: 'No news articles yet.',
        onRetry: () => ref.invalidate(healthNewsProvider),
        onRefresh: () async {
          ref.invalidate(healthNewsProvider);
          await ref.read(healthNewsProvider.future);
        },
        onOpen: (item) =>
            context.router.push(HealthNewsDetailRoute(id: item.id)),
      ),
    );
  }
}

class _HealthContentListBody extends StatelessWidget {
  const _HealthContentListBody({
    required this.async,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.emptyLabel,
    required this.onRetry,
    required this.onRefresh,
    required this.onOpen,
  });

  final AsyncValue<HealthContentListResponse> async;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final String emptyLabel;
  final VoidCallback onRetry;
  final Future<void> Function() onRefresh;
  final void Function(HealthContentItem item) onOpen;

  @override
  Widget build(BuildContext context) {
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => ImshErrorPanel(
        message: healthContentErrorMessage(error),
        onRetry: onRetry,
      ),
      data: (response) {
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ResponsiveBody(
            expand: false,
            builder: (context, bp) {
              final items = response.data
                  .where((item) => item.isCurrent)
                  .toList();
              final carouselHeight =
                  (MediaQuery.sizeOf(context).height * 0.62).clamp(
                    340.0,
                    640.0,
                  );

              if (items.isEmpty) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    ImshPageHeader(
                      title: title,
                      subtitle: subtitle,
                      icon: icon,
                      iconColor: iconColor,
                    ),
                    const SizedBox(height: 12),
                    ImshEmptyState(
                      icon: icon,
                      iconColor: iconColor,
                      message: emptyLabel,
                    ),
                  ],
                );
              }

              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  ImshPageHeader(
                    title: title,
                    subtitle: subtitle,
                    icon: icon,
                    iconColor: iconColor,
                  ),
                  const SizedBox(height: 8),
                  HealthContentCarousel(
                    items: items,
                    accent: iconColor,
                    height: carouselHeight,
                    onOpen: onOpen,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

@RoutePage()
class HealthCampaignDetailScreen extends ConsumerWidget {
  const HealthCampaignDetailScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(healthCampaignDetailProvider(id));
    return _HealthContentDetailScaffold(
      title: 'Campaign',
      icon: Icons.campaign_outlined,
      iconColor: ImshAccentColors.green,
      item: item,
      loading: ref.watch(healthCampaignsProvider).isLoading,
      error: ref.watch(healthCampaignsProvider).hasError
          ? healthContentErrorMessage(ref.watch(healthCampaignsProvider).error!)
          : null,
      onRetry: () => ref.invalidate(healthCampaignsProvider),
    );
  }
}

@RoutePage()
class HealthNewsDetailScreen extends ConsumerWidget {
  const HealthNewsDetailScreen({super.key, @PathParam('id') required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(healthNewsDetailProvider(id));
    return _HealthContentDetailScaffold(
      title: 'News',
      icon: Icons.newspaper_outlined,
      iconColor: ImshAccentColors.blue,
      item: item,
      loading: ref.watch(healthNewsProvider).isLoading,
      error: ref.watch(healthNewsProvider).hasError
          ? healthContentErrorMessage(ref.watch(healthNewsProvider).error!)
          : null,
      onRetry: () => ref.invalidate(healthNewsProvider),
    );
  }
}

class _HealthContentDetailScaffold extends StatelessWidget {
  const _HealthContentDetailScaffold({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.item,
    required this.loading,
    required this.error,
    required this.onRetry,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final HealthContentItem? item;
  final bool loading;
  final String? error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ImshAppBar(title: Text(title)),
      body: Builder(
        builder: (context) {
          if (loading && item == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (error != null && item == null) {
            return ImshErrorPanel(message: error!, onRetry: onRetry);
          }
          if (item == null) {
            return ImshEmptyState(
              icon: icon,
              iconColor: iconColor,
              message: 'Content not found',
            );
          }

          final imageUrl = resolveApiMediaUrl(item!.imageUrl);
          final headline = item!.hasTitle ? item!.title.trim() : title;
          final published = item!.publishedAt == null
              ? null
              : DateFormatter.medicalDate(item!.publishedAt!);

          return ResponsiveBody(
            expand: false,
            builder: (context, bp) {
              return ListView(
                children: [
                  ImshPageHeader(
                    title: headline,
                    subtitle: published ?? (item!.hasImage ? 'Infographic' : null),
                    icon: icon,
                    iconColor: iconColor,
                  ),
                  const SizedBox(height: 12),
                  if (imageUrl != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppDesignTokens.radiusXl,
                      ),
                      child: ColoredBox(
                        color: iconColor.withValues(alpha: 0.08),
                        child: InteractiveViewer(
                          panEnabled: false,
                          minScale: 1,
                          maxScale: 4,
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.fitWidth,
                            width: double.infinity,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return const SizedBox(
                                height: 240,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                            errorBuilder: (_, _, _) => const SizedBox(
                              height: 160,
                              child: Center(
                                child: Text('Could not load image'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  if (item!.hasBody)
                    ImshSurfaceCard(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        item!.body.trim(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.45,
                        ),
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
