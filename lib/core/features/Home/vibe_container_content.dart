import 'package:dailyvibe/core/features/Home/delete_item/delete_button.dart';
import 'package:dailyvibe/core/features/Home/small_label_text_style.dart';
import 'package:dailyvibe/core/features/Home/tag_generator.dart/tags_to_container.dart';
import 'package:dailyvibe/core/theme.dart';
import 'package:dailyvibe/core/utils/capitalize.dart';
import 'package:dailyvibe/models/vibe.dart';
import 'package:flutter/material.dart';

class VibeContentContainer extends StatelessWidget {
  const VibeContentContainer({
    super.key,
    required this.vibe,
    required this.onDelete,
  });
  final Vibe vibe;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(12, 6, 0, 6),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(66, 13, 14, 15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Emoji diplayer
          Text(
            // Displayed the first emoji that user selected tags
            vibe.emoji[0],
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          s12W,
          // List of user vibes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SmallLabel(labelText: 'mode : '),
                  SizedBox(width: MediaQuery.of(context).size.width - 190),
                  DeleteItem(onDelete: onDelete),
                ],
              ),
              Text(
                toCaptelize(vibe.modeText),
                maxLines: 2,
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.left,

                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
              s4H,
              // Picked tags
              Row(
                children: [
                  SmallLabel(labelText: 'tags : '),
                  tagGenerator(context, vibe.tags),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
