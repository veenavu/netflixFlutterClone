import 'package:flutter/material.dart';

import '../../core/color/color.dart';

class VideoShowWIdget extends StatelessWidget {
  final String imageUrl;
  const VideoShowWIdget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            width: double.infinity,
            height: 180,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 17,
            // ignore: deprecated_member_use
            backgroundColor: black.withOpacity(0.5),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_off,
                  color: white,
                  size: 17,
                )),
          ),
        )
      ],
    );
  }
}
