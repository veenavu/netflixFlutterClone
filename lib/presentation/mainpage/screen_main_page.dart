
import 'package:flutter/material.dart';
import 'package:netflixclone/presentation/mainpage/widget/bottom_nav.dart';

import '../downloads/screen_downlods.dart';
import '../fast_laughs/fast_laughs_screen.dart';
import '../home/home_screen.dart';
import '../new_hot/new_hot_screen.dart';
import '../search/search_screen.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});

  final _pages = [
   HomeScreen(),
   NewHotScreen(),
   FastLaughsScreenMain(),
   SearchScreen(),
   ScreenDownlods(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child:  ValueListenableBuilder(valueListenable: indexChengeNotifier, builder: (context, int index, _) {
        return _pages[index];
      },),),
     
      bottomNavigationBar:  BottomNavigation(),
    );
  }
}