import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
class CustomButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;

  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconSize = 25,
    this.textSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: white,
          size: iconSize,
        ),
        Text(
          title,
          style:  TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: textSize,
          ),
        ),
      ],
    );
  }
}