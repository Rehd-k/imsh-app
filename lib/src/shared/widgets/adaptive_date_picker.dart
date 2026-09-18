import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

DateTime _dateOnly(DateTime date) => DateTime(date.year, date.month, date.day);

/// Material date picker on Android/web; Cupertino modal picker on iOS.
Future<DateTime?> showAdaptiveDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  String? helpText,
}) {
  final first = _dateOnly(firstDate);
  final last = _dateOnly(lastDate);
  var clamped = _dateOnly(initialDate);
  if (clamped.isBefore(first)) clamped = first;
  if (clamped.isAfter(last)) clamped = last;

  final useCupertino =
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS);

  if (useCupertino) {
    return _showCupertinoDatePicker(
      context: context,
      initialDate: clamped,
      firstDate: first,
      lastDate: last,
    );
  }

  return showDatePicker(
    context: context,
    initialDate: clamped,
    firstDate: first,
    lastDate: last,
    helpText: helpText,
  );
}

Future<DateTime?> _showCupertinoDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) {
  var selected = initialDate;

  return showModalBottomSheet<DateTime>(
    context: context,
    builder: (sheetContext) {
      final colorScheme = Theme.of(sheetContext).colorScheme;
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.of(sheetContext).pop(),
                  child: const Text('Cancel'),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => Navigator.of(sheetContext).pop(selected),
                  child: const Text('Done'),
                ),
              ],
            ),
            SizedBox(
              height: 216,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  brightness: Theme.of(sheetContext).brightness,
                  primaryColor: colorScheme.primary,
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: initialDate,
                  minimumDate: firstDate,
                  maximumDate: lastDate,
                  onDateTimeChanged: (value) => selected = value,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
