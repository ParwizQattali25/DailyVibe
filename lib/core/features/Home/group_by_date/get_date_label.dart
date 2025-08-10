import 'package:intl/intl.dart';

// This method reutrns a label after comparing date
String getDateLabel(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final dateOnly = DateTime(date.year, date.month, date.day);
  if (dateOnly == today) {
    return 'Today';
  } else if (dateOnly == today.subtract(Duration(days: 1))) {
    return 'Yesterday';
  } else {
    // MMM dd and yy are special things for formating day for example dd 2 numbers for day
    return DateFormat('MMMM dd, yyyy').format(date);
  }
}
