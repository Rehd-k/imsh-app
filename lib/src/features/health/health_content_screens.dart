import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';
import '../../core/utils/api_media_url.dart';
import '../../helper/date_formatter.dart';
import '../../models/health_content_model.dart';
import '../../providers/health_content_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';

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
        emptyLabel: 'No campaigns right now.',
        onRetry: () => ref.invalidate(healthCampaignsProvider),
        onRefresh: () async {
          ref.invalidate(healthCampaignsProvider);
          await ref.read(healthCampaignsProvider.future);
        },
        onOpen: (item) => context.router.push(
          HealthCampaignDetailRoute(id: item.id),
        ),
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
        emptyLabel: 'No news articles yet.',
        onRetry: () => ref.invalidate(healthNewsProvider),
        onRefresh: () async {
          ref.invalidate(healthNewsProvider);
          await ref.read(healthNewsProvider.future);
        },
        onOpen: (item) => context.router.push(
          HealthNewsDetailRoute(id: item.id),
        ),
      ),
    );
  }
}

class _HealthContentListBody extends StatelessWidget {
  const _HealthContentListBody({
    required this.async,
    required this.emptyLabel,
    required this.onRetry,
    required this.onRefresh,
    required this.onOpen,
  });

  final AsyncValue<HealthContentListResponse> async;
  final String emptyLabel;
  final VoidCallback onRetry;
  final Future<void> Function() onRefresh;
  final void Function(HealthContentItem item) onOpen;

  @override
  Widget build(BuildContext context) {
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(healthContentErrorMessage(error), textAlign: TextAlign.center),
              const Gap(AppDesignTokens.spacingMd),
              FilledButton(onPressed: onRetry, child: const Text('Retry')),
            ],
          ),
        ),
      ),
      data: (response) {
        if (response.data.isEmpty) {
          return Center(
            child: Text(
              emptyLabel,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.separated(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            itemCount: response.data.length,
            separatorBuilder: (_, __) => const Gap(AppDesignTokens.spacingMd),
            itemBuilder: (context, index) {
              final item = response.data[index];
              return _HealthContentCard(item: item, onTap: () => onOpen(item));
            },
          ),
        );
      },
    );
  }
}

class _HealthContentCard extends StatelessWidget {
  const _HealthContentCard({required this.item, required this.onTap});

  final HealthContentItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final imageUrl = resolveApiMediaUrl(item.imageUrl);

    return Material(
      color: colorScheme.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (imageUrl != null)
                AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
              Padding(
                padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const Gap(AppDesignTokens.spacingXs),
                    Text(
                      item.excerpt,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                    ),
                    if (item.publishedAt != null) ...[
                      const Gap(AppDesignTokens.spacingSm),
                      Text(
                        DateFormatter.medicalDate(item.publishedAt!),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
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
  const HealthNewsDetailScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(healthNewsDetailProvider(id));
    return _HealthContentDetailScaffold(
      title: 'News',
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
    required this.item,
    required this.loading,
    required this.error,
    required this.onRetry,
  });

  final String title;
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
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(error!, textAlign: TextAlign.center),
                  const Gap(AppDesignTokens.spacingMd),
                  FilledButton(onPressed: onRetry, child: const Text('Retry')),
                ],
              ),
            );
          }
          if (item == null) {
            return const Center(child: Text('Content not found'));
          }

          final imageUrl = resolveApiMediaUrl(item!.imageUrl);
          return ListView(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            children: [
              if (imageUrl != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                ),
                const Gap(AppDesignTokens.spacingLg),
              ],
              Text(
                item!.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              if (item!.publishedAt != null) ...[
                const Gap(AppDesignTokens.spacingXs),
                Text(
                  DateFormatter.medicalDate(item!.publishedAt!),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
              const Gap(AppDesignTokens.spacingLg),
              Text(
                item!.body,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.45,
                    ),
              ),
            ],
          );
        },
      ),
    );
  }
}
