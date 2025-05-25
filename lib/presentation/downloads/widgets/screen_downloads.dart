import 'dart:ffi' hide Size;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widget.dart';

import '../../../core/constants/constants.dart';
class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final List imageList=[
    'https://image.tmdb.org/t/p/w1280/juA4IWO52Fecx8lhAsxmDgy3M3.jpg',
    'https://image.tmdb.org/t/p/w1280/7vygX4ObgOmZn7E2P95mCeqCmqV.jpg',
    'https://image.tmdb.org/t/p/w1280/j91LJmcWo16CArFOoapsz84bwxb.jpg'
  ];


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), child: AppBarWidget(title: 'Downloads',)),
      body: ListView(
        children: [
          Row(
            children: [
              kWidth,
              Icon(Icons.settings,color: KWhiteColor,),
              kWidth,
              Text('Smart Downloads'),
            ],
          ),
          Text('Introducing Downloads for you'),
          Text('We will download a personalised selection of movies and shows for you,so there is always something to watch on your device'),
          Container(
            width: size.width,
            height: size.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width*0.37 ,
                ),
                DownloadsImageWidget(margin: EdgeInsets.only(left: 130,bottom: 50,), imageList: imageList[0],angle: 20,size: Size(size.width*0.4,size.width*0.58),),
                DownloadsImageWidget(margin: EdgeInsets.only(right: 130,bottom: 50), imageList: imageList[1],angle: -20,size: Size(size.width*0.4,size.width*0.58),),
                DownloadsImageWidget(radius:30,margin: EdgeInsets.only(left: 20,bottom: 10), imageList: imageList[2],size: Size(size.width*0.5,size.width*0.65),),
              ],
            ),
          ),
          MaterialButton(onPressed: (){},child: Text('Set up',style: TextStyle(color: KWhiteColor,fontWeight: FontWeight.bold),),color: KBlueButton,),
          MaterialButton(onPressed: (){},child: Text('See what you can download',style: TextStyle(color: KBlackColor,fontWeight: FontWeight.bold),),color: KWhiteColor,),

        ],
      ),
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    this.angle=0,
    required this.margin,
    required this.imageList,
    required this.size,
    this.radius=10,
  });


  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle*pi/180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
        width: size.width,
        height: size.height,
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(image:  NetworkImage(imageList))),
            ),
      ),
    );
  }
}
