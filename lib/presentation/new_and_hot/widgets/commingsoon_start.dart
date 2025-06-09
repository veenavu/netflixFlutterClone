
import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../../core/colors/colors.dart';
import '../../../models/movies.dart';
import 'coming_soon_widget.dart';
class CommingSoonStart extends StatefulWidget {
  const CommingSoonStart({super.key});

  @override
  State<CommingSoonStart> createState() => _CommingSoonStartState();
}

class _CommingSoonStartState extends State<CommingSoonStart> {
  late Future<List<Movie>> commingSoonMovie;

  @override
  void initState(){
    super.initState();
    commingSoonMovie = ApiService().fetchAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: commingSoonMovie,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(
              color: red, backgroundColor: black,
            ),
          );
        }else if(snapshot.hasData){
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) =>
                CommingSoonWIdgetMain(index: index,snapshot: snapshot,)

            ,);
        }else{
          return Center(
            child:  CircularProgressIndicator(
              color: red,backgroundColor: black,
            ),
          );
        }
      },
    );
  }
}