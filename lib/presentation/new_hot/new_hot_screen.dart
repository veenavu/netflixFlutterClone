
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/presentation/new_hot/screens/commingsoon_start.dart';
import 'package:netflixclone/presentation/new_hot/screens/everyones_start.dart';

import '../../core/color/color.dart';
import '../../core/constants.dart';

class NewHotScreen extends StatelessWidget {
  const NewHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: black,
            title: Text(
              "New & Hot",
              style: GoogleFonts.montserrat(
                  fontSize: 29, color: white, fontWeight: FontWeight.w900),
            ),
            actions: [
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
                      padding: const EdgeInsets.only(left: 5.0, right: 10),
                      child: Divider(
                        thickness: 2,
                      ),
                    )
                  ],
                ),
              ),
              width
            ],
            bottom: TabBar(
                padding: EdgeInsets.symmetric(horizontal: 10),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: black,
                unselectedLabelColor: white,
                indicator: BoxDecoration(color: white, borderRadius: kRadius30),
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                labelColor: black,
                tabs: [
                  Tab(
                    text: "🍿   Comming Soon",
                  ),
                  Tab(
                    text: "👀  Everyone's Watch",
                  ),
                ]),
          ),
          body: TabBarView(children: [
            
            _buildEveryONesWatching(),
            _buildCommingSoon(),
            
          ]),
        ));
  }
}

Widget _buildEveryONesWatching() {
     return CommingSoonStart();

}

Widget _buildCommingSoon() {
     return EveryOnesStart();
}


