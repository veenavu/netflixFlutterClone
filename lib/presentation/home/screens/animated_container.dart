
import 'package:flutter/material.dart';
import '../../../core/color/color.dart';
import '../../../core/constants.dart';

class CustomAnimatedCotainer extends StatelessWidget {
  const CustomAnimatedCotainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(seconds: 1),
        width: double.infinity,
        height: 80,
        // ignore: deprecated_member_use
        color: Colors.black.withOpacity(0.4),
        child: Column(
          children: [
            Row(
              children: [
                   Image.network(
                  'https://static.vecteezy.com/system/resources/previews/019/956/195/non_2x/netflix-transparent-netflix-free-free-png.png',
                  width: 65,
                  height: 62,
                  fit: BoxFit.cover,
                ),
                const Spacer(),
                const Icon(Icons.cast, color: white, size: 30),
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
                          padding: const EdgeInsets.only(
                            left: 3.0,
                            top: 8,
                          ),
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
                          padding: const EdgeInsets.only(
                            left: 6.0,
                            top: 8,
                          ),
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
                        padding: const EdgeInsets.only(
                            left: 5.0, right: 10),
                        child: Divider(
                          thickness: 2,
                        ), 
                      )
                    ],
                  ),
                ),
                width
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "TV Show",
                  style: kHomeTitleText,
                ),
                Text(
                  "Movies",
                  style: kHomeTitleText,
                ),
                Text(
                  "Categories",
                  style: kHomeTitleText,
                )
              ],
            )
          ],
        ),
      );
  }
}
