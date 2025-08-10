import 'package:flutter/material.dart';

class TextFormStyle extends StatelessWidget {
  const TextFormStyle({
    super.key,
    required this.onValidate,
    required this.onSave,
    required this.labelText,
  });
  final String labelText;
  final String? Function(String?)? onValidate;
  final Function(String newValue) onSave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: const Color.fromARGB(255, 203, 203, 204),
        fontWeight: FontWeight.w500,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: onValidate,
      onSaved: (newValue) {
        onSave(newValue!);
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: labelText,
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
