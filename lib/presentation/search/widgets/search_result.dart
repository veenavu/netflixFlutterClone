import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/presentation/search/widgets/titile.dart';

import 'package:netflixclone/presentation/widgets/main_card.dart';

const imageURL='https://image.tmdb.org/t/p/w1280/juA4IWO52Fecx8lhAsxmDgy3M3.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Movies & TV'),
        KHeight,
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 8 ,

            shrinkWrap: true,
            crossAxisSpacing: 8,
            crossAxisCount: 3,
            childAspectRatio: 1/1.4,
            children: List.generate(20, (index) {
              return const MainCard();
            }),
          ),
        ),
      ],
    );
  }
}
//
// class MainCard extends StatelessWidget {
//   const MainCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(image: NetworkImage(imageURL),fit: BoxFit.cover),
//         borderRadius: BorderRadius.circular(7),
//       ),
//     );
//   }
// }
