import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextTitle extends StatelessWidget {
  final String title;
  const SearchTextTitle({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          GoogleFonts.montserrat(fontSize: 23, fontWeight: FontWeight.bold),
    );
  }
}
