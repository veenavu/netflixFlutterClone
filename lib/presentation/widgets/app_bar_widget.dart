 import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants/constants.dart';
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text('Downloads'),
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
