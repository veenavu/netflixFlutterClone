import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/home/widgets/number_title_card.dart';
import 'package:netflixclone/presentation/widgets/main_title_card.dart';

import '../widgets/main_card.dart';
import 'widgets/background_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                BackgroundCard(),
                MainTitleCard(
                  title: "Released in the Past Year",
                ),
                MainTitleCard(
                  title: "Trending Now",
                ),
                NumberTitleCard(),
                MainTitleCard(
                  title: "Tense Dramas",
                ),
                MainTitleCard(
                  title: "South Indian Cinema",
                ),
              ],
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              child: Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.0),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          "https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png",
                          width: 50,
                          height: 50,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.cast,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 30,
                          height: 30,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "TV Shows",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Movies",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
