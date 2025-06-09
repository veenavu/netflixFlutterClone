
import 'package:flutter/material.dart';

import '../../../core/color/color.dart';

ValueNotifier<int> indexChengeNotifier = ValueNotifier<int>(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChengeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: newIndex,
          onTap: (index) {
            indexChengeNotifier.value = index;
          },
          selectedItemColor: white,
          unselectedItemColor: grey,
          selectedIconTheme: const IconThemeData(color: white),
          unselectedIconTheme: const IconThemeData(
            color: grey,
          ),
          backgroundColor: black,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.video_collection_rounded),
              icon: Icon(Icons.video_library_outlined), label: 'New & Hot',),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.emoji_emotions_sharp),
              icon: Icon(Icons.emoji_emotions_outlined),label: 'Fast Laughs'),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.search_outlined),
              icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.download_for_offline_sharp),
              icon: Icon(Icons.arrow_circle_down_rounded),label: 'Downloads'),
          ],
        );
      },
    );
  }
}
