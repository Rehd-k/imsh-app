import 'package:intl/intl.dart';

abstract final class CurrencyFormatter {
  static final _formatter = NumberFormat.currency(
    locale: 'en_NG',
    symbol: '₦',
    decimalDigits: 2,
  );

  /// Formats a decimal string from the API (e.g. `"124500.00"`).
  static String formatAmount(String amount) {
    final value = double.tryParse(amount) ?? 0;
    return _formatter.format(value);
  }
}
