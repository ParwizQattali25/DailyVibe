import 'package:flutter/material.dart';

class SmallLabel extends StatelessWidget {
  const SmallLabel({super.key, required this.labelText});
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: const Color.fromARGB(255, 92, 92, 99),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
