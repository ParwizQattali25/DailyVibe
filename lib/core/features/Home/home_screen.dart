import 'package:dailyvibe/core/features/Home/fallback_content.dart';
import 'package:dailyvibe/core/features/Home/group_by_date/grouping_vibes.dart';
import 'package:dailyvibe/core/features/Home/vibe_container_content.dart';
import 'package:dailyvibe/models/vibe.dart';
import 'package:dailyvibe/core/features/New_Vibe/add_new_vibe_screen.dart';
import 'package:flutter/material.dart';
import 'package:dailyvibe/core/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Vibe> addedVibes = [];

  // This method adds new vibes to the list
  void addNewVibe(BuildContext context) async {
    final newlyAddedVibe = await Navigator.of(context).push<Vibe>(
      MaterialPageRoute(
        fullscreenDialog: true,

        builder: (ctx) {
          return NewVibeScreen();
        },
      ),
    );
    setState(() {
      // adds new vibe that created by the user to the list of addedVibes
      addedVibes.add(newlyAddedVibe!);
      // sort vibes by the the newest date
      addedVibes.sort((a, b) => b.date.compareTo(a.date));
    });
  }

  @override
  Widget build(BuildContext context) {
    final groupedVibes = groupVibes(addedVibes);
    // The fallback to show when there is not added any vibe by the user and its empty
    Widget content = FallBackContentWidget();
    // Contents to show when there are vibes
    if (addedVibes.isNotEmpty) {
      content = ListView(
        children: [
          // Passes the Map of grouped vibes to labes and cards
          ...groupedVibes.entries.map((element) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(element.key, style: TextStyle(color: Colors.white)),
                  s8H,
                  ...element.value.map((singleVibe) {
                    final vibe = singleVibe;
                    return VibeContentContainer(
                      vibe: vibe,
                      onDelete: () {
                        setState(() {
                          addedVibes.remove(singleVibe);
                        });
                        Navigator.of(context).pop();
                      },
                    );
                  }),
                ],
              ),
            );
          }),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🌙 Daily Vibes 🍃',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewVibe(context);
        },
        isExtended: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Icon(Icons.add_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: content,
    );
  }
}
