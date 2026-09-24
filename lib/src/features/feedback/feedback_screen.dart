import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:imsh/app_router.gr.dart';

import '../../core/responsive.dart';
import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';
import '../../core/theme/imsh_accent_colors.dart';
import '../../helper/date_formatter.dart';
import '../../models/feedback_model.dart';
import '../../providers/feedback_provider.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_empty_state.dart';
import '../../shared/widgets/imsh_error_panel.dart';
import '../../shared/widgets/imsh_page_header.dart';
import '../../shared/widgets/imsh_semantic_badge.dart';
import '../../shared/widgets/imsh_solid_icon.dart';
import '../../shared/widgets/imsh_surface_card.dart';

const _kSectionGap = 10.0;

@RoutePage()
class PatientFeedbackScreen extends ConsumerWidget {
  const PatientFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kind = ref.watch(feedbackKindFilterProvider);
    final status = ref.watch(feedbackStatusFilterProvider);
    final listAsync = ref.watch(
      feedbackListProvider((kind: kind, status: status)),
    );

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Suggestions & complaints')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.router.push(const CreateFeedbackRoute()),
        icon: const Icon(Icons.add_comment_outlined),
        label: const Text('New'),
      ),
      body: ResponsiveBody(
        expand: false,
        bottomPadding: 88,
        builder: (context, bp) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(feedbackListProvider((kind: kind, status: status)));
            await ref.read(
              feedbackListProvider((kind: kind, status: status)).future,
            );
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              const ImshPageHeader(
                title: 'Suggestions & complaints',
                subtitle: 'Tell us what went well or what we should improve',
                icon: Icons.forum_outlined,
                iconColor: ImshAccentColors.purple,
              ),
              const Gap(_kSectionGap),
              _FeedbackFilters(kind: kind, status: status),
              const Gap(_kSectionGap),
              listAsync.when(
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppDesignTokens.spacingXl),
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (error, _) => ImshErrorPanel(
                  message: feedbackErrorMessage(error),
                  onRetry: () => ref.invalidate(
                    feedbackListProvider((kind: kind, status: status)),
                  ),
                ),
                data: (response) {
                  if (response.data.isEmpty) {
                    return const ImshEmptyState(
                      title: 'No feedback yet',
                      message:
                          'Create a complaint, suggestion, or general feedback whenever you need to reach the hospital team.',
                      icon: Icons.forum_outlined,
                      iconColor: ImshAccentColors.purple,
                    );
                  }
                  return Column(
                    children: [
                      for (final item in response.data) ...[
                        _FeedbackListCard(item: item),
                        const Gap(_kSectionGap),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@RoutePage()
class FeedbackDetailScreen extends ConsumerWidget {
  const FeedbackDetailScreen({super.key, @PathParam('id') required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(feedbackDetailProvider(id));
    final closeNotifier = ref.watch(closeFeedbackProvider.notifier);
    final isClosing =
        ref.watch(closeFeedbackProvider).value?.contains(id) ?? false;

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Feedback detail')),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ImshErrorPanel(
          message: feedbackErrorMessage(error),
          onRetry: () => ref.invalidate(feedbackDetailProvider(id)),
        ),
        data: (feedback) {
          final canEdit = feedback.status == PatientFeedbackStatus.open;
          return ResponsiveBody(
            expand: false,
            builder: (context, bp) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ImshPageHeader(
                    title: feedback.subject,
                    subtitle: feedback.createdAt == null
                        ? '—'
                        : DateFormatter.dateTime(feedback.createdAt!),
                    icon: Icons.forum_outlined,
                    iconColor: ImshAccentColors.purple,
                    trailing: _FeedbackStatusBadge(status: feedback.status),
                  ),
                  const Gap(AppDesignTokens.spacingSm),
                  _FeedbackKindBadge(kind: feedback.kind),
                  const Gap(12),
                  _DetailBlock(
                    title: 'Message',
                    value: feedback.message,
                    icon: Icons.notes_outlined,
                    iconColor: ImshAccentColors.indigo,
                  ),
                  if (feedback.department != null) ...[
                    const Gap(_kSectionGap),
                    _DetailBlock(
                      title: 'Department',
                      value: feedback.department!.name,
                      icon: Icons.apartment_outlined,
                      iconColor: ImshAccentColors.teal,
                    ),
                  ],
                  if (feedback.staffResponse?.isNotEmpty == true) ...[
                    const Gap(12),
                    ImshSurfaceCard(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              ImshSolidIcon(
                                icon: Icons.reply_outlined,
                                color: ImshAccentColors.blue,
                                size: 32,
                                iconSize: 16,
                              ),
                              Gap(10),
                              Expanded(
                                child: Text(
                                  'Hospital response',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          const Gap(AppDesignTokens.spacingSm),
                          Text(feedback.staffResponse!),
                          if (feedback.respondedBy != null) ...[
                            const Gap(AppDesignTokens.spacingSm),
                            Text(
                              'By ${feedback.respondedBy!.displayName}',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: context.colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                  const Gap(24),
                  if (canEdit) ...[
                    FilledButton.icon(
                      onPressed: () =>
                          context.router.push(EditFeedbackRoute(id: id)),
                      icon: const Icon(Icons.edit_outlined),
                      label: const Text('Edit feedback'),
                    ),
                    const Gap(AppDesignTokens.spacingSm),
                    OutlinedButton.icon(
                      onPressed: isClosing
                          ? null
                          : () async {
                              final confirmed = await showDialog<bool>(
                                context: context,
                                builder: (dialogContext) => AlertDialog(
                                  title: const Text('Close feedback?'),
                                  content: const Text(
                                    'This will remove it from your open requests, but the hospital will keep the record.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(dialogContext).pop(false),
                                      child: const Text('Cancel'),
                                    ),
                                    FilledButton(
                                      onPressed: () =>
                                          Navigator.of(dialogContext).pop(true),
                                      child: const Text('Close'),
                                    ),
                                  ],
                                ),
                              );
                              if (confirmed != true) return;
                              await closeNotifier.close(id);
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Feedback closed.'),
                                ),
                              );
                              context.router.maybePop();
                            },
                      icon: isClosing
                          ? const SizedBox.square(
                              dimension: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.close_outlined),
                      label: const Text('Close feedback'),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

@RoutePage()
class CreateFeedbackScreen extends StatelessWidget {
  const CreateFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _FeedbackFormScaffold();
  }
}

@RoutePage()
class EditFeedbackScreen extends ConsumerWidget {
  const EditFeedbackScreen({super.key, @PathParam('id') required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(feedbackDetailProvider(id));

    return detailAsync.when(
      loading: () => const Scaffold(
        appBar: ImshAppBar(title: Text('Edit feedback')),
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        appBar: ImshAppBar(title: const Text('Edit feedback')),
        body: ImshErrorPanel(
          message: feedbackErrorMessage(error),
          onRetry: () => ref.invalidate(feedbackDetailProvider(id)),
        ),
      ),
      data: (feedback) => _FeedbackFormScaffold(feedback: feedback),
    );
  }
}

class _FeedbackFormScaffold extends ConsumerStatefulWidget {
  const _FeedbackFormScaffold({this.feedback});

  final PatientFeedback? feedback;

  @override
  ConsumerState<_FeedbackFormScaffold> createState() =>
      _FeedbackFormScaffoldState();
}

class _FeedbackFormScaffoldState extends ConsumerState<_FeedbackFormScaffold> {
  final _formKey = GlobalKey<FormState>();
  late PatientFeedbackKind _kind;
  late final TextEditingController _subjectController;
  late final TextEditingController _messageController;

  bool get _isEditing => widget.feedback != null;

  @override
  void initState() {
    super.initState();
    _kind = widget.feedback?.kind ?? PatientFeedbackKind.general;
    _subjectController = TextEditingController(text: widget.feedback?.subject);
    _messageController = TextEditingController(text: widget.feedback?.message);
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final request = CreateFeedbackRequest(
      kind: _kind,
      subject: _subjectController.text.trim(),
      message: _messageController.text.trim(),
      departmentId: widget.feedback?.department?.id,
    );

    try {
      final saved = await ref
          .read(submitFeedbackProvider.notifier)
          .submit(request: request, feedbackId: widget.feedback?.id);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isEditing ? 'Feedback updated.' : 'Feedback sent.'),
        ),
      );
      context.router.replace(FeedbackDetailRoute(id: saved.id));
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(feedbackErrorMessage(error))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSubmitting = ref.watch(submitFeedbackProvider).isLoading;

    return Scaffold(
      appBar: ImshAppBar(
        title: Text(_isEditing ? 'Edit feedback' : 'New feedback'),
      ),
      body: ResponsiveBody(
        expand: false,
        builder: (context, bp) => SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ImshPageHeader(
                  title: _isEditing ? 'Edit feedback' : 'New feedback',
                  subtitle: 'Share a suggestion or complaint with the hospital',
                  icon: Icons.add_comment_outlined,
                  iconColor: ImshAccentColors.purple,
                ),
                const Gap(12),
                DropdownButtonFormField<PatientFeedbackKind>(
                  initialValue: _kind,
                  decoration: const InputDecoration(
                    labelText: 'Type',
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                  items: [
                    for (final kind in PatientFeedbackKind.values)
                      DropdownMenuItem(value: kind, child: Text(kind.label)),
                  ],
                  onChanged: isSubmitting
                      ? null
                      : (value) {
                          if (value != null) setState(() => _kind = value);
                        },
                ),
                const Gap(_kSectionGap),
                TextFormField(
                  controller: _subjectController,
                  enabled: !isSubmitting,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                    prefixIcon: Icon(Icons.subject_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter a subject.';
                    }
                    return null;
                  },
                ),
                const Gap(_kSectionGap),
                TextFormField(
                  controller: _messageController,
                  enabled: !isSubmitting,
                  minLines: 5,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    labelText: 'Message',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.notes_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Tell us what happened or what you suggest.';
                    }
                    return null;
                  },
                ),
                const Gap(12),
                FilledButton.icon(
                  onPressed: isSubmitting ? null : _submit,
                  icon: isSubmitting
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.send_outlined),
                  label: Text(_isEditing ? 'Save changes' : 'Submit feedback'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeedbackFilters extends ConsumerWidget {
  const _FeedbackFilters({required this.kind, required this.status});

  final PatientFeedbackKind? kind;
  final PatientFeedbackStatus? status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: AppDesignTokens.spacingSm,
      runSpacing: AppDesignTokens.spacingSm,
      children: [
        ChoiceChip(
          label: const Text('All'),
          selected: kind == null && status == null,
          onSelected: (_) {
            ref.read(feedbackKindFilterProvider.notifier).state = null;
            ref.read(feedbackStatusFilterProvider.notifier).state = null;
          },
        ),
        for (final value in PatientFeedbackKind.values)
          ChoiceChip(
            label: Text(value.label),
            selected: kind == value,
            onSelected: (_) {
              ref.read(feedbackKindFilterProvider.notifier).state = value;
            },
          ),
        for (final value in PatientFeedbackStatus.values)
          ChoiceChip(
            label: Text(value.label),
            selected: status == value,
            onSelected: (_) {
              ref.read(feedbackStatusFilterProvider.notifier).state = value;
            },
          ),
      ],
    );
  }
}

class _FeedbackListCard extends StatelessWidget {
  const _FeedbackListCard({required this.item});

  final PatientFeedback item;

  @override
  Widget build(BuildContext context) {
    final accent = item.kind == PatientFeedbackKind.complaint
        ? ImshAccentColors.amber
        : ImshAccentColors.purple;

    return ImshSurfaceCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        onTap: () => context.router.push(FeedbackDetailRoute(id: item.id)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImshSolidIcon(
                icon: Icons.forum_outlined,
                color: accent,
                size: 36,
                iconSize: 18,
                radius: 10,
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ImshEllipsisText(
                            text: item.subject,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        _FeedbackStatusBadge(status: item.status),
                      ],
                    ),
                    const Gap(AppDesignTokens.spacingSm),
                    _FeedbackKindBadge(kind: item.kind),
                    const Gap(AppDesignTokens.spacingSm),
                    Text(
                      item.message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (item.createdAt != null) ...[
                      const Gap(AppDesignTokens.spacingSm),
                      Text(
                        DateFormatter.dateTime(item.createdAt!),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
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

class _FeedbackStatusBadge extends StatelessWidget {
  const _FeedbackStatusBadge({required this.status});

  final PatientFeedbackStatus status;

  @override
  Widget build(BuildContext context) {
    final tone = switch (status) {
      PatientFeedbackStatus.open => ImshSemanticTone.info,
      PatientFeedbackStatus.inReview => ImshSemanticTone.warning,
      PatientFeedbackStatus.resolved => ImshSemanticTone.success,
      PatientFeedbackStatus.closed => ImshSemanticTone.neutral,
    };
    return ImshSemanticBadge(label: status.label, tone: tone);
  }
}

class _FeedbackKindBadge extends StatelessWidget {
  const _FeedbackKindBadge({required this.kind});

  final PatientFeedbackKind kind;

  @override
  Widget build(BuildContext context) {
    return ImshSemanticBadge(
      label: kind.label,
      tone: kind == PatientFeedbackKind.complaint
          ? ImshSemanticTone.error
          : ImshSemanticTone.neutral,
    );
  }
}

class _DetailBlock extends StatelessWidget {
  const _DetailBlock({
    required this.title,
    required this.value,
    this.icon,
    this.iconColor,
  });

  final String title;
  final String value;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ImshSurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                ImshSolidIcon(
                  icon: icon!,
                  color: iconColor ?? ImshAccentColors.indigo,
                  size: 28,
                  iconSize: 14,
                  radius: 8,
                ),
                const Gap(8),
              ],
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const Gap(AppDesignTokens.spacingXs),
          Text(value),
        ],
      ),
    );
  }
}
