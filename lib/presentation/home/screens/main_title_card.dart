

import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widget/main_card_widget.dart';
import '../../widget/main_title.dart';

class MainTitleCardWidget extends StatelessWidget {
  final String title;
  final AsyncSnapshot snapshot;

  const MainTitleCardWidget({
    super.key,required this.title, required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Column( 
      children: [
        MainTitleWidget(title:title),
        LimitedBox(
          maxHeight: 176,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) => HomeMainCard(snapshot: snapshot,index: index,),
             separatorBuilder: (context, index) => kwidth8, itemCount: 10)
        ),
        hight,
      ],
    );
  }
}
