import 'package:intl/intl.dart';

/// Returns a [DateTime] object or `null` if the input is invalid.
DateTime? stringToDate(String dateStr,
    {String format = 'yyyy-MM-dd HH:mm:ss'}) {
  try {
    final DateFormat formatter = DateFormat(format);
    return formatter.parse(dateStr);
  } catch (e) {
    return null; // Handle invalid format
  }
}

/// Returns a formatted date string.
String dateToString(DateTime dateTime, {String format = 'dd.MM.yyyy HH:mm'}) {
  try {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(dateTime);
  } catch (e) {
    return ''; // Handle invalid formatting
  }
}
