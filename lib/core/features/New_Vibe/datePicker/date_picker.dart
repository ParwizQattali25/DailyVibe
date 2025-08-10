import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.dateController,
    required this.onTap,
  });
  final TextEditingController dateController;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dateController,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: const Color.fromARGB(255, 203, 203, 204),
        fontWeight: FontWeight.w500,
      ),
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.calendar_month_rounded,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,

        labelText: 'Pick a date',
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: const Color.fromARGB(255, 67, 75, 78)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: const Color.fromARGB(255, 203, 203, 204),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
