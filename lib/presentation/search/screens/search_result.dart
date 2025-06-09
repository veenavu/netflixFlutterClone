
import 'package:flutter/material.dart';
import 'package:netflixclone/presentation/search/screens/search_text_title.dart';

import '../../../api/api.dart';
import '../../../core/color/color.dart';
import '../../../core/constants.dart';
import '../../../models/movie.dart';



class SearchResultWidget extends StatelessWidget {
  final String result;
  const SearchResultWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Movies & TV'),
        hight,
        Expanded(
            child: FutureBuilder(
          future:ApiService().searchResult(result) ,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: red,
                  backgroundColor: black,
                ),
              );
            } else if(snapshot.hasError){
              return const Center(
                child: Text('Error Loading data ⚠️',style: TextStyle(color: white),),
              );
            } else if(!snapshot.hasData || snapshot.data!.isEmpty){
              return const Center(
                child: Text('No Data Found ⁉️',style: TextStyle(color: red),),
              );
            }else{
               return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1/1.4,
                ), 
                itemBuilder:(context, index) {
                  var data = snapshot.data![index];
                  return MainCardWidget(
                    movie: data,
                  );
                },
                );
            }
          },
        ))
      ],
    );
  }
}

class MainCardWidget extends StatelessWidget {
  final Movie movie;
  const MainCardWidget(
      {super.key, required this.movie, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image:  DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                '${Constants.imagePath}${movie.poseterPath}',
              ))),
    );
  }
}
