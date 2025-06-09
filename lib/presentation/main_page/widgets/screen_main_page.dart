import 'package:flutter/material.dart';

import '../../downloads/screen_downloads.dart';
import '../../fast_laugh/screen_fast_laugh.dart';
import '../../home/screen_home.dart';
import '../../new_and_hot/screen_new_and_hot.dart';
import '../../search/screen_search.dart';
import 'bottom_nav.dart';

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