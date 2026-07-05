import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../models/radiology_report_model.dart';
import '../../../providers/radiology_reports_provider.dart';

Future<void> showRadiologyFilterSheet(BuildContext context, WidgetRef ref) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDesignTokens.radiusLg),
      ),
    ),
    builder: (context) => const _RadiologyFilterSheet(),
  );
}

class _RadiologyFilterSheet extends ConsumerStatefulWidget {
  const _RadiologyFilterSheet();

  @override
  ConsumerState<_RadiologyFilterSheet> createState() =>
      _RadiologyFilterSheetState();
}

class _RadiologyFilterSheetState extends ConsumerState<_RadiologyFilterSheet> {
  RadiologyReportStatus? _status;
  DateTime? _dateFrom;
  DateTime? _dateTo;

  @override
  void initState() {
    super.initState();
    final filter = ref.read(radiologyReportFilterProvider);
    _status = filter.status;
    _dateFrom = filter.dateFrom;
    _dateTo = filter.dateTo;
  }

  Future<void> _pickDate({required bool isFrom}) async {
    final initial = isFrom ? _dateFrom : _dateTo;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked == null || !mounted) return;
    setState(() {
      if (isFrom) {
        _dateFrom = picked;
      } else {
        _dateTo = picked;
      }
    });
  }

  void _apply() {
    ref.read(radiologyReportFilterProvider.notifier).state =
        RadiologyReportFilter(
      status: _status,
      dateFrom: _dateFrom,
      dateTo: _dateTo,
    );
    Navigator.of(context).pop();
  }

  void _clear() {
    ref.read(radiologyReportFilterProvider.notifier).state =
        const RadiologyReportFilter();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: AppDesignTokens.containerPadding,
        right: AppDesignTokens.containerPadding,
        top: AppDesignTokens.spacingMd,
        bottom: MediaQuery.viewInsetsOf(context).bottom +
            AppDesignTokens.spacingLg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Filter reports',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(AppDesignTokens.spacingMd),
          Text(
            'Status',
            style: theme.textTheme.labelLarge,
          ),
          const Gap(AppDesignTokens.spacingSm),
          Wrap(
            spacing: AppDesignTokens.spacingSm,
            runSpacing: AppDesignTokens.spacingSm,
            children: [
              FilterChip(
                label: const Text('All'),
                selected: _status == null,
                onSelected: (_) => setState(() => _status = null),
              ),
              for (final status in RadiologyReportStatus.values)
                FilterChip(
                  label: Text(status.label),
                  selected: _status == status,
                  onSelected: (selected) => setState(
                    () => _status = selected ? status : null,
                  ),
                ),
            ],
          ),
          const Gap(AppDesignTokens.spacingMd),
          Text(
            'Date range',
            style: theme.textTheme.labelLarge,
          ),
          const Gap(AppDesignTokens.spacingSm),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _pickDate(isFrom: true),
                  child: Text(
                    _dateFrom == null
                        ? 'From'
                        : '${_dateFrom!.day}/${_dateFrom!.month}/${_dateFrom!.year}',
                  ),
                ),
              ),
              const Gap(AppDesignTokens.spacingSm),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _pickDate(isFrom: false),
                  child: Text(
                    _dateTo == null
                        ? 'To'
                        : '${_dateTo!.day}/${_dateTo!.month}/${_dateTo!.year}',
                  ),
                ),
              ),
            ],
          ),
          const Gap(AppDesignTokens.spacingLg),
          FilledButton(
            onPressed: _apply,
            child: const Text('Apply filters'),
          ),
          const Gap(AppDesignTokens.spacingSm),
          TextButton(
            onPressed: _clear,
            child: const Text('Clear all'),
          ),
        ],
      ),
    );
  }
}
