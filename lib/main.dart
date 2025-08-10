import 'package:dailyvibe/core/features/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 59, 148),
          brightness: Brightness.dark,
        ),
        // setting up the font across all the app
        textTheme: GoogleFonts.nunitoTextTheme().copyWith(),
        scaffoldBackgroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      home: HomeScreen(),
    );
  }
}
