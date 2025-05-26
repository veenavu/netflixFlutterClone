import 'dart:ffi' hide Size;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widget.dart';

import '../../../core/constants/constants.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final List imageList = [
    'https://image.tmdb.org/t/p/w1280/juA4IWO52Fecx8lhAsxmDgy3M3.jpg',
    'https://image.tmdb.org/t/p/w1280/7vygX4ObgOmZn7E2P95mCeqCmqV.jpg',
    'https://image.tmdb.org/t/p/w1280/j91LJmcWo16CArFOoapsz84bwxb.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: 'Downloads'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          KHeight,
          const _SmartDownloads(),
          SizedBox(height: 30),
          Text(
            'Introducing Downloads for You',
            style: TextStyle(
              color: KWhiteColor,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            "We'll download a personalised selection of\n"
                "movies and shows for you, so there's\n"
                "always something to watch on your\n"
                "device.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
              height: 1.4,
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: size.width,
            height: size.width * 0.9,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.38,
                  backgroundColor: Colors.grey.withOpacity(0.4),
                ),
                // Back left image
                DownloadsImageWidget(
                  margin: EdgeInsets.only(right: 70, top: 50),
                  imageList: imageList[0],
                  angle: -15,
                  size: Size(size.width * 0.35, size.width * 0.50),
                ),
                // Back right image
                DownloadsImageWidget(
                  margin: EdgeInsets.only(left: 70, top: 50),
                  imageList: imageList[1],
                  angle: 15,
                  size: Size(size.width * 0.35, size.width * 0.50),
                ),
                // Front center image (larger)
                DownloadsImageWidget(
                  radius: 8,
                  margin: EdgeInsets.only(top: 20),
                  imageList: imageList[2],
                  size: Size(size.width * 0.4, size.width * 0.56),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            color: KBlueButton,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Set Up',
                style: TextStyle(
                  color: KWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            color: KWhiteColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'See What You Can Download',
                style: TextStyle(
                  color: KBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.settings,
          color: KWhiteColor,
          size: 24,
        ),
        SizedBox(width: 8),
        Text(
          'Smart Downloads',
          style: TextStyle(
            color: KWhiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    this.angle = 0,
    required this.margin,
    required this.imageList,
    required this.size,
    this.radius = 10,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageList),
          ),
        ),
      ),
    );
  }
}
