
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/color/color.dart';
import '../../../core/constants.dart';
import '../../widget/custom_button.dart';
import '../../widget/vidoe_widget.dart';

class EveryonesWachingWIdget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;

  const EveryonesWachingWIdget({
    super.key, required this.snapshot, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            hight,
             Text(
                '${snapshot.data[index].originalName}',
                style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w900, fontSize: 18, height: 1.7),
              ),
               Text(
                '${snapshot.data[index].overview}',
                style: TextStyle(color: avatarGray),
                overflow: TextOverflow.ellipsis,
                maxLines: 6,
              ),hight35,
              VideoShowWIdget(imageUrl: '${Constants.imagePath}${snapshot.data[index].poseterPath}',),hight,
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               CustomButtonWidget(icon: Icons.share_outlined, title: 'Share',textSize: 10,iconSize: 23,),width,
               CustomButtonWidget(icon: Icons.add, title: 'MyList',textSize: 10),width,
               CustomButtonWidget(icon: Icons.play_arrow, title: 'Play',textSize: 10,),width,
              ],
             )
            ],
          ),
        );
  }
}