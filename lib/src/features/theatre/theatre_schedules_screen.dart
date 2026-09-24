import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/responsive.dart';
import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../helper/date_formatter.dart';
import '../../models/theatre_schedule_model.dart';
import '../../providers/theatre_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_empty_state.dart';
import '../../shared/widgets/imsh_ellipsis_chip.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import '../../shared/widgets/imsh_page_header.dart';
import '../../shared/widgets/imsh_semantic_badge.dart';
import '../../shared/widgets/imsh_solid_icon.dart';
import '../../shared/widgets/imsh_surface_card.dart';

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
        error: (error, _) => ImshErrorPanel(
          message: theatreErrorMessage(error),
          onRetry: () => ref.invalidate(theatreSchedulesProvider),
        ),
        data: (response) {
          final items = <_TheatreListItem>[
            for (final schedule in response.schedules)
              _TheatreListItem.schedule(schedule),
            for (final request in response.surgeryRequests)
              if (request.schedule == null) _TheatreListItem.request(request),
          ];

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(theatreSchedulesProvider);
              await ref.read(theatreSchedulesProvider.future);
            },
            child: ResponsiveBody(
              expand: false,
              builder: (context, bp) {
                if (items.isEmpty) {
                  return ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: const [
                      ImshPageHeader(
                        title: 'Theatre schedule',
                        subtitle: 'Upcoming procedures and surgery requests.',
                        icon: Icons.local_hospital_outlined,
                        iconColor: ImshAccentColors.pink,
                      ),
                      SizedBox(height: 12),
                      ImshEmptyState(
                        icon: Icons.local_hospital_outlined,
                        iconColor: ImshAccentColors.pink,
                        message: 'No theatre schedules yet.',
                      ),
                    ],
                  );
                }

                return ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: items.length + 1,
                  separatorBuilder: (_, index) =>
                      SizedBox(height: index == 0 ? 12 : 8),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const ImshPageHeader(
                        title: 'Theatre schedule',
                        subtitle: 'Upcoming procedures and surgery requests.',
                        icon: Icons.local_hospital_outlined,
                        iconColor: ImshAccentColors.pink,
                      );
                    }
                    return _TheatreCard(item: items[index - 1]);
                  },
                );
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
  String get title => schedule?.displayProcedureName ?? request!.procedureName;
  String get status => schedule?.statusLabel ?? request!.statusLabel;
  DateTime? get when => schedule?.scheduledAt ?? request?.createdAt;
  String get subtitle => schedule?.roomLabel ?? 'Awaiting scheduling';
}

class _TheatreCard extends StatelessWidget {
  const _TheatreCard({required this.item});

  final _TheatreListItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final title = item.title.trim().isEmpty ? '—' : item.title;
    final subtitle = item.subtitle.trim().isEmpty ? '—' : item.subtitle;
    final status = item.status.trim().isEmpty ? '—' : item.status;

    return ImshSurfaceCard(
      padding: const EdgeInsets.all(10),
      onTap: () =>
          context.router.push(TheatreScheduleDetailRoute(id: item.id)),
      child: Row(
        children: [
          const ImshSolidIcon(
            icon: Icons.local_hospital_outlined,
            color: ImshAccentColors.pink,
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
                ),
                const SizedBox(height: 2),
                ImshEllipsisText(
                  text: subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
                if (item.when != null) ...[
                  const SizedBox(height: 2),
                  ImshEllipsisText(
                    text: DateFormatter.dateTime(item.when!),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          ImshEllipsisChip(
            label: status,
            tone: ImshSemanticTone.info,
          ),
        ],
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
        error: (error, _) => ImshErrorPanel(
          message: theatreErrorMessage(error),
          onRetry: () => ref.invalidate(theatreSchedulesProvider),
        ),
        data: (_) {
          if (schedule == null) {
            return const ImshEmptyState(
              icon: Icons.local_hospital_outlined,
              iconColor: ImshAccentColors.pink,
              message: 'Schedule not found',
            );
          }

          return ResponsiveBody(
            expand: false,
            builder: (context, bp) {
              return ListView(
                children: [
                  ImshPageHeader(
                    title: schedule.displayProcedureName.trim().isEmpty
                        ? '—'
                        : schedule.displayProcedureName,
                    subtitle: schedule.statusLabel.trim().isEmpty
                        ? '—'
                        : schedule.statusLabel,
                    icon: Icons.local_hospital_outlined,
                    iconColor: ImshAccentColors.pink,
                  ),
                  const SizedBox(height: 12),
                  ImshSurfaceCard(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        _DetailTile(
                          icon: Icons.meeting_room_outlined,
                          accent: ImshAccentColors.indigo,
                          label: 'Theatre room',
                          value: schedule.roomLabel,
                        ),
                        if (schedule.scheduledAt != null)
                          _DetailTile(
                            icon: Icons.event_outlined,
                            accent: ImshAccentColors.teal,
                            label: 'Scheduled',
                            value: DateFormatter.dateTime(schedule.scheduledAt!),
                          ),
                        if (schedule.estimatedDurationMins != null)
                          _DetailTile(
                            icon: Icons.timer_outlined,
                            accent: ImshAccentColors.amber,
                            label: 'Estimated duration',
                            value: '${schedule.estimatedDurationMins} mins',
                          ),
                        if (schedule.surgeon != null)
                          _DetailTile(
                            icon: Icons.person_outline,
                            accent: ImshAccentColors.blue,
                            label: 'Surgeon',
                            value: schedule.surgeon!.displayName,
                          ),
                        if (schedule.anaesthetist != null)
                          _DetailTile(
                            icon: Icons.health_and_safety_outlined,
                            accent: ImshAccentColors.purple,
                            label: 'Anaesthetist',
                            value: schedule.anaesthetist!.displayName,
                          ),
                        if (schedule.scrubNurse != null)
                          _DetailTile(
                            icon: Icons.medical_services_outlined,
                            accent: ImshAccentColors.green,
                            label: 'Scrub nurse',
                            value: schedule.scrubNurse!.displayName,
                            isLast: schedule.notes?.trim().isNotEmpty != true,
                          ),
                      ],
                    ),
                  ),
                  if (schedule.notes?.trim().isNotEmpty == true) ...[
                    const SizedBox(height: 10),
                    ImshSurfaceCard(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ImshSectionHeader(
                            title: 'Notes',
                            icon: Icons.notes_outlined,
                            iconColor: ImshAccentColors.indigo,
                          ),
                          const SizedBox(height: 8),
                          Text(schedule.notes!),
                        ],
                      ),
                    ),
                  ],
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _DetailTile extends StatelessWidget {
  const _DetailTile({
    required this.icon,
    required this.accent,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  final IconData icon;
  final Color accent;
  final String label;
  final String value;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImshSolidIcon(
            icon: icon,
            color: accent,
            size: 30,
            iconSize: 16,
            radius: 8,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
                ImshEllipsisText(
                  text: value.trim().isEmpty ? '—' : value,
                  style: theme.textTheme.bodyLarge?.copyWith(
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
