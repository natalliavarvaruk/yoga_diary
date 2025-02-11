
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoga_diary/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(0, 255, 253, 255),
  surface: const Color.fromARGB(0, 255, 255, 255),

);

final theme = ThemeData().copyWith(
  
  scaffoldBackgroundColor: colorScheme.surface,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().apply(
  bodyColor: const Color.fromARGB(255, 130, 60, 210),
  displayColor: const Color.fromARGB(255, 110, 62, 159),
).copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    ),

    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
);

void main() {
  runApp(
    ProviderScope(child:  MyApp())
   );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Great Places',
      theme: theme,
      home: HomeScreen(),
    );
  }
}