import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/presentation/search/widgets/search_text_title.dart';

import '../../../api/api.dart';
import '../../../models/movies.dart';

const imageUrl = 'https://media.themoviedb.org/t/p/w710_and_h400_multi_faces/wHNwlE6ftEpgjVbdhLXOtv1hLs0.jpg';

class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget> {
  late Future<List<Movie>> searchList;

  @override
  void initState() {
    super.initState();
    searchList = ApiService().dramaMovie();
  }

  @override
  Widget build(BuildContext context) {
    var children = [
      const SearchTextTitle(
        title: 'Top Search',
      ),
      hight,
      Expanded(
          child: FutureBuilder(
            future: searchList,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: CircularProgressIndicator(
                    color: red,
                    backgroundColor: black,
                  ),
                );
              } else if (snapshot.hasData) {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => TopSearchItemIdle(snapshot: snapshot,index: index,),
                    separatorBuilder: (context, index) => khight18,
                    itemCount: 20);
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: red,
                    backgroundColor: black,
                  ),
                );
              }
            },
          ))
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class TopSearchItemIdle extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;
  const TopSearchItemIdle({super.key, required this.snapshot, required this.index,});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 66,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                '${Constants.imagePath}${snapshot.data[index].poseterPath}',
              ),
            ),
          ),
        ),
        width,
        Expanded(
            child: Text(
              '${snapshot.data[index].originalTitile}',
              style: TextStyle(
                  color: white, fontWeight: FontWeight.bold, fontSize: 16),
            )),
        const CircleAvatar(
          backgroundColor: white,
          radius: 24,
          child: CircleAvatar(
            backgroundColor: black,
            radius: 23.4,
            child: Icon(
              CupertinoIcons.play_arrow_solid,
              color: white,
            ),
          ),
        )
      ],
    );
  }
}