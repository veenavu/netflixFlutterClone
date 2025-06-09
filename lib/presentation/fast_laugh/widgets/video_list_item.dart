
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/presentation/fast_laugh/widgets/video_emotion.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';

class VideoListItem extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;
  const VideoListItem({super.key,required this.index,required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: kRadius9,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '${Constants.imagePath}${snapshot.data[index].poseterPath}',

                  ))
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //*Left side portion
                CircleAvatar(
                  // ignore: deprecated_member_use
                    backgroundColor: Colors.black.withOpacity(0.6),
                    radius: 30,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.volume_off,color: white,))),

                //*Right side portion
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage('${Constants.imagePath}${snapshot.data[index].backDropPath}'),
                      ),
                    ),
                    VideoEmotionsActions(icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoEmotionsActions(icon: CupertinoIcons.add, title: 'My List'),
                    VideoEmotionsActions(icon: Icons.share, title: 'Share'),
                    VideoEmotionsActions(icon: Icons.play_arrow, title: 'Play'),


                  ],
                )
              ],),
          ),
        )
      ],
    );
  }
}