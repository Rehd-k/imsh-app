import 'package:intl/intl.dart';

import 'app_timezone.dart';

class DateFormatter {
  static DateTime _asLagos(DateTime date) => AppTimezone.toLocal(date);

  static String shortDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(_asLagos(date));
  }

  static String fullDate(DateTime date) {
    return DateFormat('EEEE, MMMM d, yyyy').format(_asLagos(date));
  }

  static String dateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy hh:mm a').format(_asLagos(date));
  }

  static String dateTimeWithSeconds(DateTime date) {
    return DateFormat('dd/MM/yyyy hh:mm:ss a').format(_asLagos(date));
  }

  static String medicalDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(_asLagos(date));
  }

  static String appointmentCardDate(DateTime date) {
    return DateFormat('MMM d, yyyy').format(_asLagos(date));
  }

  static String appointmentCardTime(DateTime date) {
    return DateFormat('hh:mm a').format(_asLagos(date));
  }

  static String appointmentCompactDate(DateTime date) {
    return DateFormat('MMM d').format(_asLagos(date));
  }

  static String appointmentCompactTime(DateTime date) {
    return DateFormat('HH:mm').format(_asLagos(date));
  }
}
