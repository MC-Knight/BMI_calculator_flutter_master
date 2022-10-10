import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_calculator/bmi_screen.dart';
import 'package:bmi_calculator/splash_screen.dart';

const knbackgroundColor = Color(0xFF263238);
const knblueGreyColor = Color(0xFF37474F);
const kntranparentColor = Color(0xFFECEFF1);
void main() {
  runApp(const KnightApp());
}

class KnightApp extends StatelessWidget {
  const KnightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
              bodyLarge: GoogleFonts.poppins(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              bodyMedium: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              bodySmall: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              labelSmall: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.w500)),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
          bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: knblueGreyColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: knblueGreyColor),
          iconTheme: const IconThemeData(size: 90, color: Colors.white),
          useMaterial3: true),
      home: const SplashScreenPage(),
    );
  }
}
