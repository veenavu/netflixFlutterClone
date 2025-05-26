import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';

import '../../downloads/widgets/screen_downloads.dart';
import '../../fast_laugh/screen_fast_laugh.dart';
import '../../home/screen_home.dart';
import '../../new_and_hot/screen_new_and_hot.dart';
import '../../search/screen_search.dart';
import 'bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});

    final _pages=[
      ScreenHome(),
      ScreenNewAndHot(),
      ScreenFastLaugh(),
      ScreenSearch(),
      //ScreenDownloads(),
      NetflixHomePage(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, int index, _){
          return _pages[index];
        },),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
