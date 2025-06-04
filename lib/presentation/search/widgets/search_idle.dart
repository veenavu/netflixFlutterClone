import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/presentation/search/widgets/titile.dart';

const imageUrl = 'https://media.themoviedb.org/t/p/w710_and_h400_multi_faces/wHNwlE6ftEpgjVbdhLXOtv1hLs0.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KHeight,
          Text(
              'Top Searches',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
          ),
          KHeight,
          Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => TopSearchItemTile(),
                  separatorBuilder: (context, index) => KHeight20,
                  itemCount: 10,
              ),
          ),
        ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
            width: screenWidth * 0.35,
            height: 65,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                ),

                borderRadius: BorderRadius.circular(5),
            ),
        ),
        Expanded(
            child: SearchTextTitle(
                title: 'Movie Name',
            ),
        ),
        //Icon(CupertinoIcons.play_fill,color: KWhiteColor,),
        CircleAvatar(
            radius: 25,
            backgroundColor: KWhiteColor,
            child: CircleAvatar(
                radius: 23,
                backgroundColor: backgroundColor,
                child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(
                        CupertinoIcons.play_fill,
                        color: KWhiteColor),
                ),
            ),
        ),
      ],
    );
  }
}
