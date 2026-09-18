import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../core/theme/context_extensions.dart';
import '../../../models/cycle_model.dart';
import '../../../providers/cycle_provider.dart';
import '../../../providers/service_providers.dart';

Future<void> showCycleSettingsSheet({
  required BuildContext context,
  required CycleSettings settings,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDesignTokens.radiusLg),
      ),
    ),
    builder: (context) => CycleSettingsSheet(settings: settings),
  );
}

class CycleSettingsSheet extends ConsumerStatefulWidget {
  const CycleSettingsSheet({super.key, required this.settings});

  final CycleSettings settings;

  @override
  ConsumerState<CycleSettingsSheet> createState() => _CycleSettingsSheetState();
}

class _CycleSettingsSheetState extends ConsumerState<CycleSettingsSheet> {
  late int _cycleLength;
  late int _periodLength;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _cycleLength = widget.settings.cycleLengthDays;
    _periodLength = widget.settings.periodLengthDays;
  }

  Future<void> _save() async {
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await ref
          .read(cycleServiceProvider)
          .updateSettings(
            cycleLengthDays: _cycleLength,
            periodLengthDays: _periodLength,
          );
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = context.colorScheme;
    final bottom = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDesignTokens.containerPadding,
        AppDesignTokens.spacingMd,
        AppDesignTokens.containerPadding,
        AppDesignTokens.spacingLg + bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
            'Cycle settings',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(AppDesignTokens.spacingSm),
          Text(
            'Used when there are fewer than two logged cycles. Predictions are estimates, not medical advice.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppDesignTokens.spacingLg),
          Text(
            'Typical cycle length: $_cycleLength days',
            style: theme.textTheme.titleSmall,
          ),
          Slider(
            min: 21,
            max: 45,
            divisions: 24,
            value: _cycleLength.toDouble(),
            label: '$_cycleLength',
            onChanged: _saving
                ? null
                : (value) => setState(() => _cycleLength = value.round()),
          ),
          Text(
            'Typical period length: $_periodLength days',
            style: theme.textTheme.titleSmall,
          ),
          Slider(
            min: 1,
            max: 10,
            divisions: 9,
            value: _periodLength.toDouble(),
            label: '$_periodLength',
            onChanged: _saving
                ? null
                : (value) => setState(() => _periodLength = value.round()),
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
          FilledButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Save'),
          ),
        ],
      ),
    );
  }
}
