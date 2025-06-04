import 'package:flutter/material.dart';

import 'package:netflixclone/core/colors/colors.dart';



class SearchTextTitle extends StatelessWidget {
  final String title;
  const SearchTextTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: KWhiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 16),
    );
  }
}