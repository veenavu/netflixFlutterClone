 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/core/constants/constants.dart';
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(title,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold ),),
        Spacer(),
        Icon(Icons.cast,color: Colors.white,),
        kWidth,
        Container(
          width: 30 ,
          height: 30,
          color: Colors.blue,
        ),
        kWidth,
      ],
    );
  }
}
