import 'package:flutter/material.dart';

Future<dynamic> deleteAlretDialog({
  required BuildContext context,
  required void Function() onDeletePressed,
  required void Function() onCancelPressed,
}) {
  return showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 25, 25, 29),
        title: Center(
          child: Text(
            '🗑️',
            style: TextStyle(color: const Color.fromARGB(255, 235, 16, 0)),
          ),
        ),
        alignment: Alignment.center,
        content: Text(
          'Are you sure want to delete? ',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: onDeletePressed,
            child: Text(
              'Yes <Delete>',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          TextButton(
            onPressed: onCancelPressed,
            child: Text(
              'No <Cancel>',
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
        ],
      );
    },
  );
}
