
import 'package:flutter/material.dart';

import '../../core/constants.dart';

class HomeMainCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;
  const HomeMainCard({
    super.key, required this.snapshot,required this.index,
  });


  @override
  Widget build(BuildContext context) {
    final Size displaysize = MediaQuery.of(context).size;
    return Container(
      width: displaysize.width*0.33,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: kRadius9,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
         '${Constants.imagePath}${snapshot.data[index].poseterPath}',
        
        ))
      ),
    );
  }
}