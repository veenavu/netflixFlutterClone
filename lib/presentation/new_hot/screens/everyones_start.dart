
import 'package:flutter/material.dart';
import '../../../api/api.dart';
import '../../../core/color/color.dart';
import '../../../models/movie.dart';
import 'everyones_watching.dart';

class EveryOnesStart extends StatefulWidget {
  const EveryOnesStart({super.key});

  @override
  State<EveryOnesStart> createState() => _EveryOnesStartState();
}

class _EveryOnesStartState extends State<EveryOnesStart> {
  late Future<List<Movie>> everyOnesMovie;

  @override
  void initState() {
    super.initState();
    everyOnesMovie = ApiService().fetchAllCommingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: everyOnesMovie,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(
                color: red,
                backgroundColor: black,
              ),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: 40,
              itemBuilder: (context, index) =>  EveryonesWachingWIdget(snapshot: snapshot,index: index,),
            );
          } else{
             return Center(
                child: CircularProgressIndicator(
                  color: red,
                  backgroundColor: black,
                ),
              );
          }
        });
  }
}
