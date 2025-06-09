import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTitleWidget extends StatelessWidget {
  final String title;
  const MainTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style:
            GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.bold),
      ),
    );
  }
}