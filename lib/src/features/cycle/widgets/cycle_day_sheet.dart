import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/cycle_model.dart';
import '../../../providers/cycle_provider.dart';
import '../../../providers/service_providers.dart';
import '../../../shared/widgets/adaptive_date_picker.dart';

Future<void> showCycleDaySheet({
  required BuildContext context,
  required WidgetRef ref,
  required DateTime day,
  required CycleCalendarResponse calendar,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDesignTokens.radiusLg),
      ),
    ),
    builder: (context) => CycleDaySheet(day: day, calendar: calendar),
  );
}

class CycleDaySheet extends ConsumerStatefulWidget {
  const CycleDaySheet({super.key, required this.day, required this.calendar});

  final DateTime day;
  final CycleCalendarResponse calendar;

  @override
  ConsumerState<CycleDaySheet> createState() => _CycleDaySheetState();
}

class _CycleDaySheetState extends ConsumerState<CycleDaySheet> {
  late final String _dayKey;
  CyclePeriod? _existing;
  CyclePeriod? _open;
  DateTime? _endDate;
  PatientCycleFlow? _flow;
  late final TextEditingController _notes;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _dayKey = cycleDateKey(widget.day);
    _existing = cyclePeriodOnDay(_dayKey, widget.calendar.periods);
    _open = cycleOpenPeriod(widget.calendar.periods);
    _endDate = _existing?.endDate == null
        ? null
        : cycleDateFromKey(_existing!.endDate!);
    _flow = _existing?.flow;
    _notes = TextEditingController(text: _existing?.notes ?? '');
  }

  @override
  void dispose() {
    _notes.dispose();
    super.dispose();
  }

  bool get _canEndOpenOnDay {
    if (_existing != null) return false;
    final open = _open;
    if (open == null) return false;
    return _dayKey.compareTo(open.startDate) >= 0;
  }

  Future<void> _run(Future<void> Function() action) async {
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await action();
      if (!mounted) return;
      invalidateCycle(ref);
      Navigator.of(context).pop();
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _error = cycleErrorMessage(error);
      });
    }
  }

  Future<void> _startPeriod() async {
    final endKey = _endDate == null ? null : cycleDateKey(_endDate!);
    await _run(
      () => ref
          .read(cycleServiceProvider)
          .createPeriod(
            startDate: _dayKey,
            endDate: endKey,
            flow: _flow,
            notes: _notes.text.trim().isEmpty ? null : _notes.text.trim(),
          ),
    );
  }

  Future<void> _saveExisting() async {
    final existing = _existing;
    if (existing == null) return;
    final endKey = _endDate == null ? null : cycleDateKey(_endDate!);
    await _run(
      () => ref
          .read(cycleServiceProvider)
          .updatePeriod(
            id: existing.id,
            endDate: endKey,
            clearEndDate: endKey == null,
            flow: _flow,
            clearFlow: _flow == null,
            notes: _notes.text.trim(),
            clearNotes: _notes.text.trim().isEmpty,
          ),
    );
  }

  Future<void> _endOpenOnDay() async {
    final open = _open;
    if (open == null) return;
    await _run(
      () => ref
          .read(cycleServiceProvider)
          .updatePeriod(id: open.id, endDate: _dayKey),
    );
  }

  Future<void> _delete() async {
    final existing = _existing;
    if (existing == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete this period?'),
        content: const Text(
          'This removes the logged period from your tracker.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await _run(() => ref.read(cycleServiceProvider).deletePeriod(existing.id));
  }

  Future<void> _pickEndDate() async {
    final start = _existing != null
        ? cycleDateFromKey(_existing!.startDate)
        : widget.day;
    final picked = await showAdaptiveDatePicker(
      context: context,
      initialDate: _endDate ?? start,
      firstDate: start,
      lastDate: start.add(const Duration(days: 9)),
      helpText: 'Period end date',
    );
    if (picked == null || !mounted) return;
    setState(() => _endDate = cycleDateOnly(picked));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final title = DateFormat('EEE, d MMM y').format(widget.day);
    final bottom = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDesignTokens.containerPadding,
        AppDesignTokens.spacingMd,
        AppDesignTokens.containerPadding,
        AppDesignTokens.spacingLg + bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
            const Gap(AppDesignTokens.spacingMd),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            if (_existing != null) ...[
              const Gap(4),
              Text(
                _existing!.endDate == null
                    ? 'Logged period started ${_existing!.startDate}'
                    : 'Logged ${_existing!.startDate} – ${_existing!.endDate}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const Gap(AppDesignTokens.spacingMd),
            Text('Flow', style: theme.textTheme.labelLarge),
            const Gap(AppDesignTokens.spacingSm),
            Wrap(
              spacing: AppDesignTokens.spacingSm,
              children: [
                for (final flow in PatientCycleFlow.values)
                  ChoiceChip(
                    label: Text(flow.label),
                    selected: _flow == flow,
                    onSelected: _saving
                        ? null
                        : (selected) =>
                              setState(() => _flow = selected ? flow : null),
                  ),
              ],
            ),
            const Gap(AppDesignTokens.spacingMd),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('End date'),
              subtitle: Text(
                _endDate == null
                    ? 'Still ongoing'
                    : DateFormat('d MMM y').format(_endDate!),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_endDate != null)
                    IconButton(
                      tooltip: 'Clear end date',
                      onPressed: _saving
                          ? null
                          : () => setState(() => _endDate = null),
                      icon: const Icon(Icons.close),
                    ),
                  IconButton(
                    tooltip: 'Pick end date',
                    onPressed: _saving ? null : _pickEndDate,
                    icon: const Icon(Icons.event_outlined),
                  ),
                ],
              ),
            ),
            TextField(
              controller: _notes,
              enabled: !_saving,
              maxLength: 500,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Notes',
                hintText: 'Optional',
              ),
            ),
            if (_error != null) ...[
              Text(
                _error!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.error,
                ),
              ),
              const Gap(AppDesignTokens.spacingSm),
            ],
            if (_saving)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Center(child: CircularProgressIndicator()),
              )
            else ...[
              if (_existing == null)
                FilledButton(
                  onPressed: _startPeriod,
                  child: const Text('Log period starting this day'),
                ),
              if (_existing != null)
                FilledButton(
                  onPressed: _saveExisting,
                  child: const Text('Save changes'),
                ),
              if (_canEndOpenOnDay) ...[
                const Gap(AppDesignTokens.spacingSm),
                OutlinedButton(
                  onPressed: _endOpenOnDay,
                  child: const Text('End current period on this day'),
                ),
              ],
              if (_existing != null) ...[
                const Gap(AppDesignTokens.spacingSm),
                TextButton(
                  onPressed: _delete,
                  child: const Text('Delete period'),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
