import 'package:flutter/material.dart';

class TagscontentContainer extends StatefulWidget {
  const TagscontentContainer({
    super.key,
    required this.tag,
    required this.onChanged,
    required this.emojes,
  });
  final List<String> tag;
  final List<String> emojes;

  final Function(List<String>, List<String>) onChanged;

  @override
  State<TagscontentContainer> createState() => _TagscontentContainerState();
}

class _TagscontentContainerState extends State<TagscontentContainer> {
  final List<String> selectedTags = [];
  final List<String> selectedEmoji = [];

  void tagSelector(String tag, String emoji) {
    setState(() {
      if (selectedTags.contains(tag) || selectedEmoji.contains(emoji)) {
        selectedTags.remove(tag);
        selectedEmoji.remove(emoji);
      } else {
        // the user can olnyl pick 3 tags
        if (selectedTags.length < 3) {
          selectedTags.add(tag);
          selectedEmoji.add(emoji);
        }
      }
    });

    widget.onChanged(selectedTags, selectedEmoji);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.tag.length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (conetxt, index) {
        final isSelected = selectedTags.contains(widget.tag[index]);
        return GestureDetector(
          onTap: () {
            tagSelector(widget.tag[index], widget.emojes[index]);
          },
          child: Container(
            height: 20,
            alignment: Alignment.center,
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.fromLTRB(4, 2, 8, 2),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 33, 33, 37),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              border: isSelected ? Border.all(color: Colors.blue) : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.emojes[index], style: TextStyle(fontSize: 20)),
                SizedBox(height: 4),
                Text(
                  widget.tag[index],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: const Color.fromARGB(255, 237, 233, 255),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
