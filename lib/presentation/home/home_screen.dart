
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixclone/presentation/home/screens/animated_container.dart';
import 'package:netflixclone/presentation/home/screens/background_card.dart';
import 'package:netflixclone/presentation/home/screens/main_title_card.dart';

import '../../api/api.dart';
import '../../core/color/color.dart';
import '../../core/constants.dart';
import '../../models/movie.dart';
import 'screens/number_title_widget.dart';

ValueNotifier<bool> scrollNOtifier = ValueNotifier<bool>(true);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
} 
class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> topMovies;
  late Future<List<Movie>> trandingMovie;
  late Future<List<Movie>> dramaMovie;
  late Future<List<Movie>> southIndianMovie;
  late Future<List<Movie>> top10show;

  @override
  void initState(){
    super.initState();
    topMovies = ApiService().fetchAllCommingMovie();
    trandingMovie = ApiService().topMovies();
    dramaMovie = ApiService().dramaMovie();
    southIndianMovie = ApiService().southIndiaMovie();
    top10show = ApiService().top10TvShow();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: scrollNOtifier,
      builder: (BuildContext context, value, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNOtifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNOtifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  BackgroundImage(),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        hight,
                         FutureBuilder(future: topMovies, 
                         builder: (context, snapshot){
                           if (snapshot.hasError) {
                              return Center(
                               child: CircularProgressIndicator(color:red,backgroundColor: black,),
                             );
                           } else if(snapshot.hasData){
                             return   MainTitleCardWidget(
                           title: "Relesed in the Past Year",snapshot: snapshot,
                           );
                           }else{
                            return Center(
                               child: CircularProgressIndicator(color:red,backgroundColor: black,),
                             );
                           }
                         },),
                        FutureBuilder(future: trandingMovie, builder: (context, snapshot){
                          if (snapshot.hasError) {
                              return Center(
                              child: CircularProgressIndicator(color:red,backgroundColor: black,),
                            );
                          }else if(snapshot.hasData){
                            return MainTitleCardWidget(
                              title: "Tense Dramas", snapshot: snapshot);
                          }else{
                            return Center(
                              child: CircularProgressIndicator(color:red,backgroundColor: black,),
                            );
                          }
                        }
                        ,) ,hight,
                         FutureBuilder(future: top10show, builder: (context, snapshot){
                           if (snapshot.hasError) {
                               return Center(
                               child: CircularProgressIndicator(color:red,backgroundColor: black,),
                             );
                           }else if(snapshot.hasData){
                             return NumberTitleCard(snapshot: snapshot,);
                           }else{
                             return Center(
                               child: CircularProgressIndicator(color:red,backgroundColor: black,),
                             );
                           }
                         }
                         ,) ,
                        FutureBuilder(future: dramaMovie, builder: (context, snapshot) {
                          if (snapshot.hasError){
                            return Center(
                                child: CircularProgressIndicator(color:red,backgroundColor: black,),
                              );
                          }else if(snapshot.hasData){
                             return MainTitleCardWidget(
                              title: "Trending Now", snapshot: snapshot);
                          }else{
                              return Center(
                              child: CircularProgressIndicator(color:red,backgroundColor: black,),
                            );
                          }
                        },),hight,
                        FutureBuilder(future: southIndianMovie, builder: (context, snapshot) {
                            if (snapshot.hasError){
                             return Center(
                                child: CircularProgressIndicator(color:red,backgroundColor: black,),
                              );
                            }else if(snapshot.hasData){
                               return MainTitleCardWidget(
                                title: "South Indian Cinema", snapshot: snapshot);
                            }else{
                                return Center(
                                child: CircularProgressIndicator(color:red,backgroundColor: black,),
                              );
                            }
                          },),
                      ],
                    ),
                  )
                ],
              ),
              scrollNOtifier.value == true
                  ? CustomAnimatedCotainer()
                  : hight
            ],
          ),
        );
      },
    );
  }
}
