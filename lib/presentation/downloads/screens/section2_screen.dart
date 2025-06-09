import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/color/color.dart';
import '../../../core/constants.dart';

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageLlist = [
    "https://image.tmdb.org/t/p/original/zaptq1KClzNfB89nhB2IbOzj8yD.jpg",
    "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg",
    "https://th.bing.com/th/id/OIP.d1GcIXZZulo3gLTxKGk6RwHaLH?rs=1&pid=ImgDetMain"
  ];

  @override
  Widget build(BuildContext context) {
    final Size displaysize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: displaysize.height * 0.05),
        Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              color: white, fontSize: 21, fontWeight: FontWeight.w900),
        ),
        hight,
        const Text(
          "We will download a personalised selection of \n movies and shows for you, so there's\n always something to watch on your\ndivice.",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: avatarGray, fontSize: 15, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: displaysize.width * 1,
          height: displaysize.height * 0.45,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // ignore: deprecated_member_use
              CircleAvatar(
                radius: displaysize.width * 0.4,
                // ignore: deprecated_member_use
                backgroundColor: Colors.grey.withOpacity(0.3),
              ),
              DownloadsImageWidget(
                imageLlist: imageLlist[2],
                angle: 20,
                margin: EdgeInsets.only(left: 160, bottom: 30),
                size: Size(displaysize.width * 0.36, displaysize.height * 0.25),
              ),
              DownloadsImageWidget(
                imageLlist: imageLlist[1],
                angle: -20,
                margin: EdgeInsets.only(right: 160, bottom: 30),
                size: Size(displaysize.width * 0.36, displaysize.height * 0.25),
              ),
              DownloadsImageWidget(
                imageLlist: imageLlist[0],
                angle: 0,
                margin: EdgeInsets.only(top: 0,bottom: 0),
                size: Size(displaysize.width * 0.42, displaysize.height * 0.3),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//Cards portion
class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageLlist,
    required this.angle,
    required this.margin,
    required this.size,
  });

  final String imageLlist;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(imageLlist), fit: BoxFit.cover)),
      ),
    );
  }
}
