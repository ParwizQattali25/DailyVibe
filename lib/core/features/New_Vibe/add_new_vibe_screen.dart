import 'package:dailyvibe/core/features/New_Vibe/datePicker/date_dialog.dart';
import 'package:dailyvibe/core/features/New_Vibe/datePicker/date_picker.dart';
import 'package:dailyvibe/core/features/New_Vibe/dummyData.dart';
import 'package:dailyvibe/core/features/New_Vibe/tagsPicker/tags_list_container.dart';
import 'package:dailyvibe/core/features/New_Vibe/text_field_form.dart';
import 'package:dailyvibe/core/theme.dart';
import 'package:dailyvibe/core/utils/title_label.dart';
import 'package:dailyvibe/models/vibe.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewVibeScreen extends StatefulWidget {
  const NewVibeScreen({super.key});

  @override
  State<NewVibeScreen> createState() => _NewVibeScreenState();
}

class _NewVibeScreenState extends State<NewVibeScreen> {
  TextEditingController dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String selectedModeDate = '';
  String enteredModeText = '';
  List<String> selectedTags = [];
  List<String> selectedEmoji = [];
  DateTime? pickedDate;

  void onAddingMode() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      // Pass data across screens
      Navigator.of(context).pop(
        Vibe(
          modeText: enteredModeText,
          tags: selectedTags,
          date: pickedDate!,
          emoji: selectedEmoji,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Add a new vibe 🍃',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 16),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleLabel(label: '📝 Mode'),
                s4H,
                TextFormStyle(
                  onValidate: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        value.trim().length < 10) {
                      return 'Your mode should be at least 10 characters';
                    }
                    return null;
                  },
                  onSave: (value) {
                    enteredModeText = value;
                  },
                  labelText: 'Wrie your mode',
                ),
                s12H,
                TitleLabel(label: '📅 Date'),
                s4H,
                DatePicker(
                  dateController: dateController,
                  onTap: () async {
                    pickedDate = await showDatePickerWidget(context);
        
                    dateController.text = DateFormat().add_yMMMd().format(
                      pickedDate!,
                    );
                  },
                ),
                s12H,
                TitleLabel(label: '🏷️ Select tag'),
                s4H,
                Text(
                  '       Pick 1 - 3  tags ',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
        
                s8H,
                Expanded(
                  child: TagscontentContainer(
                    tag: tagsList,
                    onChanged: (tag, emoji) {
                      selectedTags = tag;
                      selectedEmoji = emoji;
                    },
                    emojes: emoji,
                  ),
                ),
                s12H,
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      fixedSize: Size(double.infinity, 50),
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: onAddingMode,
                    icon: Icon(Icons.add_outlined, color: Colors.white),
                    label: TitleLabel(label: 'Add Mode'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
