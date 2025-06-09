
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/core/color/color.dart';

import '../../core/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        width,
        Text(
          title,
          style:
              GoogleFonts.montserrat(fontSize: 29, fontWeight: FontWeight.w900),
        ),
        const Spacer(),
        Icon(Icons.cast, color: white, size: 30),
        width,
        Container(
          decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(4),
          color: const Color.fromARGB(255, 19, 89, 67),
          ),
          height: 30,
          width: 30,
          child: Column(
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left:3.0,top: 8,),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                 padding: const EdgeInsets.only(left:6.0,top: 8,),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 5.0,right: 10),
                child: Divider(thickness: 2,),
              )
            ],
          ),
        ),
        width
      ],
    );
  }
}
