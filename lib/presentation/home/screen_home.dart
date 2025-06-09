import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/home/widgets/animated_container.dart';
import 'package:netflixclone/presentation/home/widgets/main_title_card.dart';
import 'package:netflixclone/presentation/home/widgets/number_title_widget.dart';


import '../../api/api.dart';
import '../../core/constants/constants.dart';

import '../../models/movies.dart';
import '../widgets/main_card_widget.dart';
import 'widgets/background_card.dart';

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