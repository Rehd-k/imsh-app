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
import '../../shared/widgets/imsh_solid_icon.dart';
import '../../shared/widgets/imsh_surface_card.dart';

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
        subtitle: 'Articles and updates from Ibom Specialist Hospital.',
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
              if (response.data.isEmpty) {
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

              return ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: response.data.length + 1,
                separatorBuilder: (_, index) =>
                    SizedBox(height: index == 0 ? 12 : 10),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ImshPageHeader(
                      title: title,
                      subtitle: subtitle,
                      icon: icon,
                      iconColor: iconColor,
                    );
                  }
                  final item = response.data[index - 1];
                  return _HealthContentCard(
                    item: item,
                    accent: iconColor,
                    onTap: () => onOpen(item),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _HealthContentCard extends StatelessWidget {
  const _HealthContentCard({
    required this.item,
    required this.accent,
    required this.onTap,
  });

  final HealthContentItem item;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final imageUrl = resolveApiMediaUrl(item.imageUrl);
    final title = item.title.trim().isEmpty ? '—' : item.title;
    final excerpt = item.excerpt.trim().isEmpty ? '—' : item.excerpt;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (imageUrl != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
              child: AspectRatio(
                aspectRatio: 16 / 7,
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImshSolidIcon(
                icon: Icons.article_outlined,
                color: accent,
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
                      text: title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      excerpt,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                    if (item.publishedAt != null) ...[
                      const SizedBox(height: 8),
                      ImshEllipsisText(
                        text: DateFormatter.medicalDate(item.publishedAt!),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
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
          final headline = item!.title.trim().isEmpty ? '—' : item!.title;
          final body = item!.body.trim().isEmpty ? '—' : item!.body;

          return ResponsiveBody(
            expand: false,
            builder: (context, bp) {
              return ListView(
                children: [
                  ImshPageHeader(
                    title: headline,
                    subtitle: item!.publishedAt != null
                        ? DateFormatter.medicalDate(item!.publishedAt!)
                        : '—',
                    icon: icon,
                    iconColor: iconColor,
                  ),
                  const SizedBox(height: 12),
                  if (imageUrl != null) ...[
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppDesignTokens.radiusMd),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(imageUrl, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  ImshSurfaceCard(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      body,
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
