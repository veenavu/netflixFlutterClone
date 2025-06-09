
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widget/main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const NumberTitleCard({
    super.key,required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const MainTitleWidget(title: "Top 20 TV shows in india Today"),
        LimitedBox(
            maxHeight: 176,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => NumberCardWidget(index: index,snapshot: snapshot,),
                separatorBuilder: (context, index) => kwidth8,
                itemCount: 20,)),
        hight,
      ],
    );
  }
}
