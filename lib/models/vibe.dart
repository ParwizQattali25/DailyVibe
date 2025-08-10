class Vibe {
  String modeText;
  List<String> tags;
  List<String> emoji;
  DateTime date;
  Vibe({
    required this.modeText,
    required this.tags,
    required this.date,
    required this.emoji,
  });
}

//! Learned that emojis can be used as strings
// used for initial setuping of the app

// final dummyVibes = [
//   Vibe(
//     dailyMode: 'Feeling great',
//     tags: ['chill', 'Ohao'],
//     emoji: ['😎', '😎'],
//     date: DateTime.now(),
//   ),
//   Vibe(
//     dailyMode: 'Feeling great and Chirful',
//     tags: ['Happy', 'Ohao'],
//     emoji: ['😎', '😎'],
//     date: DateTime.now(),
//   ),
// ];
