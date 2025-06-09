
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/presentation/search/screens/search_text_title.dart';

import '../../../api/api.dart';
import '../../../core/color/color.dart';
import '../../../core/constants.dart';
import '../../../models/movie.dart';


class SearchIdieWidget extends StatefulWidget {
  const SearchIdieWidget({super.key});

  @override
  State<SearchIdieWidget> createState() => _SearchIdieWidgetState();
}

class _SearchIdieWidgetState extends State<SearchIdieWidget> {
  late Future<List<Movie>> searchList;

  @override
  void initState() {
    super.initState();
    searchList =ApiService().dramaMovie();
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
                itemBuilder: (context, index) => TopSearchIteamIdiel(snapshot: snapshot,index: index,),
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

class TopSearchIteamIdiel extends StatelessWidget {
   final AsyncSnapshot snapshot;
   final int index;
  const TopSearchIteamIdiel({super.key, required this.snapshot, required this.index,});

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
