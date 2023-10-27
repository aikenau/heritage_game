import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heritage_game/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 228, 228, 228),
    background: const Color.fromARGB(255, 255, 255, 255));

final textTheme = GoogleFonts.ubuntuCondensedTextTheme().copyWith(
  titleSmall: GoogleFonts.ubuntuCondensed(
    fontWeight: FontWeight.bold,
  ),
  titleMedium: GoogleFonts.ubuntuCondensed(
    fontWeight: FontWeight.bold,
  ),
  titleLarge: GoogleFonts.aBeeZee(
    fontWeight: FontWeight.bold,
  ),
);

final theme = ThemeData.light().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: textTheme,
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quarry Bank',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
