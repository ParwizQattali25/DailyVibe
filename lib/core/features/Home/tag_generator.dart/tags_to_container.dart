import 'package:flutter/material.dart';

// This method passes the list of string of tags labels to contanires
Widget tagGenerator(BuildContext context, List<String> tags) {
  return Row(
    children: [
      ...tags.map((tag) {
        return Container(
          height: 24,
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(4, 2, 4, 2),
          padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 33, 33, 37),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            tag,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color.fromARGB(197, 186, 186, 189),
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        );
      }),
    ],
  );
}
