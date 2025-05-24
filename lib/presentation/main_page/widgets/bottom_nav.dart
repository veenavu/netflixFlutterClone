import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context,int newIndex, _) {
      return BottomNavigationBar(
        elevation: 0,
        currentIndex: newIndex,
        onTap: (index) {
          indexChangeNotifier.value = index;
        },
         backgroundColor: backgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Colors.white),

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.collections), label: 'New & Hot'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: 'FastLaughs'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Downloads'),
        ],

      );
    });
  }
}
