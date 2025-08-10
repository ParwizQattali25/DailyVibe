import 'package:flutter/material.dart';

Future<DateTime?> showDatePickerWidget(BuildContext context) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
}
