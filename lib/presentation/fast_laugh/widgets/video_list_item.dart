
import 'package:flutter/material.dart';
class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index%Colors.accents.length],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding
            (
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  radius: 30,
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.volume_off, color: Colors.white,size: 30,),)
                ),

                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('https://image.tmdb.org/t/p/w1280/juA4IWO52Fecx8lhAsxmDgy3M3.jpg'),

                      ),
                    ),

                    VideoActionWidget(icon: Icons.emoji_emotions, title: 'Lol'),
                    VideoActionWidget(icon: Icons.add, title: 'My List'),
                    VideoActionWidget(icon: Icons.share, title: 'Share'),
                    VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          ),
        ],
      ),
    );
  }
}

