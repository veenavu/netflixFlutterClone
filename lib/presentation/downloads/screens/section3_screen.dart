import 'package:flutter/material.dart';

import '../../../core/color/color.dart';

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: MaterialButton(
            minWidth: double.infinity,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: buttonBlue,
            onPressed: () {},
            child: Text(
              "Set up",
              style: TextStyle(
                  color: white, fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: white,
            onPressed: () {},
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: const Color.fromARGB(255, 30, 30, 30),
                  fontSize: 19,
                  fontWeight: FontWeight.w900),
            ),
          ),
        )
      ],
    );
  }
}
