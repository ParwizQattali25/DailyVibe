import 'package:dailyvibe/core/features/Home/delete_item/delete_alret_dialog.dart';
import 'package:flutter/material.dart';

class DeleteItem extends StatelessWidget {
  const DeleteItem({super.key, required this.onDelete});
  final void Function() onDelete;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        deleteAlretDialog(
          context: context,
          onDeletePressed: onDelete,
          onCancelPressed: () {
            Navigator.of(context).pop();
          },
        );
      },
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        iconColor: const Color.fromARGB(255, 194, 49, 33),
      ),
      child: Icon(Icons.delete),
    );
  }
}
