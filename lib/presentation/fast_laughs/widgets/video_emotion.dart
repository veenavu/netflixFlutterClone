
import 'package:flutter/material.dart';

import '../../../core/color/color.dart';

class VideoEmotionsActions extends StatelessWidget {
  final IconData icon;
  final String title;

  const VideoEmotionsActions({super.key,required this.icon,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
      child: Column(
        children: [
        Icon(icon,color: white,),
        Text(title,style: TextStyle(
          color: white, fontSize: 13
        ),)
        ],
      ),
    );
  }
}