import 'dart:ffi' hide Size;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widget.dart';

import '../../../core/constants/constants.dart';
// class ScreenDownloads extends StatelessWidget {
//   ScreenDownloads({super.key});
//   final List imageList=[
//     'https://image.tmdb.org/t/p/w1280/juA4IWO52Fecx8lhAsxmDgy3M3.jpg',
//     'https://image.tmdb.org/t/p/w1280/7vygX4ObgOmZn7E2P95mCeqCmqV.jpg',
//     'https://image.tmdb.org/t/p/w1280/j91LJmcWo16CArFOoapsz84bwxb.jpg'
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     final size=MediaQuery.of(context).size;
//     return  Scaffold(
//       appBar: PreferredSize(preferredSize: Size.fromHeight(50), child: AppBarWidget(title: 'Downloads',)),
//       body: ListView(
//         children: [
//           Row(
//             children: [
//               kWidth,
//               Icon(Icons.settings,color: KWhiteColor,),
//               kWidth,
//               Text('Smart Downloads'),
//             ],
//           ),
//           Text('Introducing Downloads for you'),
//           Text('We will download a personalised selection of movies and shows for you,so there is always something to watch on your device'),
//           Container(
//             width: size.width,
//             height: size.width,
//             color: Colors.white,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: size.width*0.37 ,
//                 ),
//                 DownloadsImageWidget(margin: EdgeInsets.only(left: 130,bottom: 50,), imageList: imageList[0],angle: 20,size: Size(size.width*0.4,size.width*0.58),),
//                 DownloadsImageWidget(margin: EdgeInsets.only(right: 130,bottom: 50), imageList: imageList[1],angle: -20,size: Size(size.width*0.4,size.width*0.58),),
//                 DownloadsImageWidget(radius:30,margin: EdgeInsets.only(left: 20,bottom: 10), imageList: imageList[2],size: Size(size.width*0.5,size.width*0.65),),
//               ],
//             ),
//           ),
//           MaterialButton(onPressed: (){},child: Text('Set up',style: TextStyle(color: KWhiteColor,fontWeight: FontWeight.bold),),color: KBlueButton,),
//           MaterialButton(onPressed: (){},child: Text('See what you can download',style: TextStyle(color: KBlackColor,fontWeight: FontWeight.bold),),color: KWhiteColor,),
//
//         ],
//       ),
//     );
//   }
// }
//
// class DownloadsImageWidget extends StatelessWidget {
//   const DownloadsImageWidget({
//     super.key,
//     this.angle=0,
//     required this.margin,
//     required this.imageList,
//     required this.size,
//     this.radius=10,
//   });
//
//
//   final String imageList;
//   final double angle;
//   final EdgeInsets margin;
//   final Size size;
//   final double radius;
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size=MediaQuery.of(context).size;
//     return Transform.rotate(
//       angle: angle*pi/180,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(radius),
//         child: Container(
//           margin: margin,
//         width: size.width,
//         height: size.height,
//
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(radius),
//             image: DecorationImage(image:  NetworkImage(imageList))),
//             ),
//       ),
//     );
//   }
// }

class NetflixHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main hero section
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              child: Stack(
                children: [
                  // Background image
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1516589178581-6cd7833ae3b2?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Dark gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.9),
                        ],
                      ),
                    ),
                  ),

                  // Top navigation bar
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Netflix logo
                          Text(
                            'N',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // Right icons
                          Row(
                            children: [
                              Icon(Icons.download, color: Colors.white, size: 24),
                              SizedBox(width: 20),
                              Icon(Icons.search, color: Colors.white, size: 24),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Category chips
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 60,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        _buildCategoryChip('TV Shows', false),
                        SizedBox(width: 12),
                        _buildCategoryChip('Movies', false),
                        SizedBox(width: 12),
                        _buildCategoryChip('Categories', true),
                      ],
                    ),
                  ),

                  // Movie details at bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Netflix Series badge
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'N',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'SERIES',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 12),

                          // Title
                          Text(
                            'The Royals',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'serif',
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 16),

                          // Genre tags
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              _buildGenreTag('Quirky'),
                              _buildGenreTag('Romantic'),
                              _buildGenreTag('Dramedy'),
                              _buildGenreTag('Notable Soundtrack'),
                              _buildGenreTag('Royalty'),
                            ],
                          ),

                          SizedBox(height: 24),

                          // Action buttons
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.play_arrow, color: Colors.black),
                                  label: Text(
                                    'Play',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 12),

                              Expanded(
                                flex: 2,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.add, color: Colors.white),
                                  label: Text(
                                    'My List',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[800],
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Recommended section
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended for New Members',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 16),

                  // Recommendation cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildRecommendationCard(
                          'Netflix Originals',
                          Colors.red[900]!,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildRecommendationCard(
                          'Skip the Queues, Watch at Home',
                          Colors.purple[700]!,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildRecommendationCard(
                          'International Movies',
                          Colors.teal[700]!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation
      bottomNavigationBar: Container(
        color: Colors.black,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavItem(Icons.home, 'Home', true),
                _buildBottomNavItem(Icons.games, 'Games', false),
                _buildBottomNavItem(Icons.video_library, 'New & Hot', false),
                _buildBottomNavItem(Icons.account_circle, 'My Netflix', false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String text, bool hasDropdown) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (hasDropdown) ...[
            SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildGenreTag(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildRecommendationCard(String title, Color color) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey[600],
          size: 24,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}