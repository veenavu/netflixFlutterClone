
import 'package:flutter/material.dart';
import 'package:netflixclone/presentation/fast_laughs/widgets/fast_laugh_widget.dart';

import '../../api/api.dart';
import '../../core/color/color.dart';
import '../../models/movie.dart';

class FastLaughsScreenMain extends StatefulWidget {
  const FastLaughsScreenMain({super.key});

  @override
  State<FastLaughsScreenMain> createState() => _FastLaughsScreenMainState();
}

class _FastLaughsScreenMainState extends State<FastLaughsScreenMain> {
  late Future<List<Movie>> fastLaugh;

  @override
  void initState() {
    super.initState();
    fastLaugh = ApiService().topMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fastLaugh,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(
              color: red,
              backgroundColor: black,
            ),
          );
        } else if (snapshot.hasData) {
          return FastLaughsScreen(
            snapshot: snapshot,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: red,
              backgroundColor: black,
            ),
          );
        }
      },
    );
  }
}
