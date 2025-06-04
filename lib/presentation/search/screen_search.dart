import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/presentation/search/widgets/search_idle.dart';
import 'package:netflixclone/presentation/search/widgets/search_result.dart';

import '../../core/constants/constants.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(backgroundColor: Colors.grey.withOpacity(0.4), prefixIcon: Icon(CupertinoIcons.search, color: Colors.grey), suffixIcon: Icon(CupertinoIcons.xmark_circle_fill, color: Colors.grey), style: TextStyle(color: Colors.white)),
              KHeight,
              Text('top searches', style: TextStyle(color: Colors.grey, fontSize: 22, fontWeight: FontWeight.bold)),
              KHeight,
               Expanded( child: SearchIdleWidget()),
              //Expanded(child: SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
