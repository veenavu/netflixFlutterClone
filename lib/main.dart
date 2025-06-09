import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/main_page/widgets/screen_main_page.dart';
import 'package:netflixclone/splash/splash_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix',
      theme: ThemeData(
          primarySwatch: primaryColor,
          scaffoldBackgroundColor: black,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: white),
            bodyMedium: TextStyle(color:white),
            bodySmall: TextStyle(color:white),
          )
      ),
      home: SplashScreen(),
    );
  }
}