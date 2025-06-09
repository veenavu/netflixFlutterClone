
import 'package:flutter/material.dart';
import 'package:netflixclone/presentation/fast_laugh/widgets/video_list_item.dart';

class FastLaughsScreen extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const FastLaughsScreen({super.key,required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(20, (index) =>VideoListItem(index: index,snapshot: snapshot,) ,)
        )
    );
  }
}