import 'package:dailyvibe/core/features/Home/group_by_date/get_date_label.dart';
import 'package:dailyvibe/models/vibe.dart';

// This mehtod groups vibes by date
Map<String, List<Vibe>> groupVibes(List<Vibe> vibes) {
  Map<String, List<Vibe>> grouped = {};
  for (var singleVibe in vibes) {
    final label = getDateLabel(singleVibe.date);
    if (!grouped.containsKey(label)) {
      grouped[label] = [];
    }
    grouped[label]!.add(singleVibe);
  }
  return grouped;
}
