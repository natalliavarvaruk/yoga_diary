
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoga_diary/screens/home_screen.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(248, 244, 202, 234),
  surface: const Color.fromARGB(255, 197, 128, 204),
);

final theme = ThemeData().copyWith(
  
  scaffoldBackgroundColor: colorScheme.surface,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().apply(
  bodyColor: const Color.fromARGB(255, 130, 60, 210),
  displayColor: const Color.fromARGB(255, 146, 93, 6),
).copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),

    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Great Places',
      theme: theme,
      home: HomeScreen(),
    );
  }
}