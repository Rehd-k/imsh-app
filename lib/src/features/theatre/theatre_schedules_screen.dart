import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';
import '../../helper/date_formatter.dart';
import '../../models/theatre_schedule_model.dart';
import '../../providers/theatre_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';

@RoutePage()
class TheatreSchedulesScreen extends ConsumerWidget {
  const TheatreSchedulesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(theatreSchedulesProvider);

    return Scaffold(
      appBar: const ImshAppBar(title: Text('Theatre schedule')),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(theatreErrorMessage(error), textAlign: TextAlign.center),
                const Gap(AppDesignTokens.spacingMd),
                FilledButton(
                  onPressed: () => ref.invalidate(theatreSchedulesProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (response) {
          final items = <_TheatreListItem>[
            for (final schedule in response.schedules)
              _TheatreListItem.schedule(schedule),
            for (final request in response.surgeryRequests)
              if (request.schedule == null)
                _TheatreListItem.request(request),
          ];

          if (items.isEmpty) {
            return Center(
              child: Text(
                'No theatre schedules yet.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(theatreSchedulesProvider);
              await ref.read(theatreSchedulesProvider.future);
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
              itemCount: items.length,
              separatorBuilder: (_, __) =>
                  const Gap(AppDesignTokens.spacingSm),
              itemBuilder: (context, index) {
                final item = items[index];
                return _TheatreCard(item: item);
              },
            ),
          );
        },
      ),
    );
  }
}

class _TheatreListItem {
  const _TheatreListItem.schedule(this.schedule) : request = null;
  const _TheatreListItem.request(this.request) : schedule = null;

  final TheatreScheduleSummary? schedule;
  final TheatreSurgeryRequestBrief? request;

  String get id => schedule?.id ?? request!.id;
  String get title =>
      schedule?.displayProcedureName ?? request!.procedureName;
  String get status =>
      schedule?.statusLabel ?? request!.statusLabel;
  DateTime? get when => schedule?.scheduledAt ?? request?.createdAt;
  String get subtitle => schedule?.roomLabel ?? 'Awaiting scheduling';
}

class _TheatreCard extends StatelessWidget {
  const _TheatreCard({required this.item});

  final _TheatreListItem item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Material(
      color: colorScheme.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
        onTap: () => context.router.push(
          TheatreScheduleDetailRoute(id: item.id),
        ),
        child: Container(
          padding: const EdgeInsets.all(AppDesignTokens.spacingMd),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesignTokens.radiusMd),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: context.imshTheme.primaryHighlight,
                  borderRadius:
                      BorderRadius.circular(AppDesignTokens.radiusSm),
                ),
                child: Icon(
                  Icons.local_hospital_outlined,
                  color: colorScheme.primary,
                ),
              ),
              const Gap(AppDesignTokens.spacingMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const Gap(2),
                    Text(
                      item.subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                    ),
                    if (item.when != null) ...[
                      const Gap(2),
                      Text(
                        DateFormatter.dateTime(item.when!),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ],
                ),
              ),
              Text(
                item.status,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
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
class TheatreScheduleDetailScreen extends ConsumerWidget {
  const TheatreScheduleDetailScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = ref.watch(theatreScheduleDetailProvider(id));
    final async = ref.watch(theatreSchedulesProvider);

    return Scaffold(
      appBar: const ImshAppBar(title: Text('Theatre details')),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(theatreErrorMessage(error))),
        data: (_) {
          if (schedule == null) {
            return const Center(child: Text('Schedule not found'));
          }

          return ListView(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            children: [
              Text(
                schedule.displayProcedureName,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const Gap(AppDesignTokens.spacingSm),
              Text(
                schedule.statusLabel,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: context.colorScheme.primary,
                    ),
              ),
              const Gap(AppDesignTokens.spacingLg),
              _DetailTile(
                icon: Icons.meeting_room_outlined,
                label: 'Theatre room',
                value: schedule.roomLabel,
              ),
              if (schedule.scheduledAt != null)
                _DetailTile(
                  icon: Icons.event_outlined,
                  label: 'Scheduled',
                  value: DateFormatter.dateTime(schedule.scheduledAt!),
                ),
              if (schedule.estimatedDurationMins != null)
                _DetailTile(
                  icon: Icons.timer_outlined,
                  label: 'Estimated duration',
                  value: '${schedule.estimatedDurationMins} mins',
                ),
              if (schedule.surgeon != null)
                _DetailTile(
                  icon: Icons.person_outline,
                  label: 'Surgeon',
                  value: schedule.surgeon!.displayName,
                ),
              if (schedule.anaesthetist != null)
                _DetailTile(
                  icon: Icons.health_and_safety_outlined,
                  label: 'Anaesthetist',
                  value: schedule.anaesthetist!.displayName,
                ),
              if (schedule.scrubNurse != null)
                _DetailTile(
                  icon: Icons.medical_services_outlined,
                  label: 'Scrub nurse',
                  value: schedule.scrubNurse!.displayName,
                ),
              if (schedule.notes?.trim().isNotEmpty == true) ...[
                const Gap(AppDesignTokens.spacingMd),
                Text(
                  'Notes',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const Gap(AppDesignTokens.spacingXs),
                Text(schedule.notes!),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _DetailTile extends StatelessWidget {
  const _DetailTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDesignTokens.spacingMd),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colorScheme.primary),
          const Gap(AppDesignTokens.spacingMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
