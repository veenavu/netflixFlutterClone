import 'dart:convert';


import 'package:http/http.dart' as http;

import '../core/constants.dart';
import '../models/movie.dart';

class ApiService {
  static const _topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _trandingUrl ='https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';
  static const _dramaUrl ='https://api.themoviedb.org/3/discover/tv?api_key=${Constants.apiKey}';
  static final _southIndiaUrl = "https://api.themoviedb.org/3/discover/tv?api_key=${Constants.apiKey}&with_original_language=hi&sort_by=popularity.desc";
  static final _top10ShowUrl ="https://api.themoviedb.org/3/discover/tv?api_key=${Constants.apiKey}";
  static const _upcommingUrl ="https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apiKey}&with_original_language=hi&sort_by=popularity.desc";
  static const _upcommingUrl2 ="https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}&with_original_language=hi&sort_by=popularity.desc";
  static const _commingsoon1 ="https://api.themoviedb.org/3/tv/on_the_air?api_key=${Constants.apiKey}&with_original_language=hi&sort_by=popularity.desc";
  static const _commingsoon2 ="https://api.themoviedb.org/3/tv/airing_today?api_key=${Constants.apiKey}&with_original_language=hi&sort_by=popularity.desc";

  Future<List<Movie>> topMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.formJson(movie)).toList();
    } else {
      throw Exception('Failed to load top-rated movies. Status Code: ${response.statusCode}');
    }
  }

  Future<List<Movie>> dramaMovie() async {
    final response = await http.get(Uri.parse(_trandingUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.formJson(movie)).toList();
    } else {
      throw Exception( 'Failed to load top-rated movies. Status Code: ${response.statusCode}');
    }
  }

  Future<List<Movie>> trandingMovie() async {
    final response = await http.get(Uri.parse(_dramaUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.formJson(movie)).toList();
    } else {
      throw Exception('Failed to load top-rated movies. Status Code: ${response.statusCode}');
    }
  }

  Future<List<Movie>> southIndiaMovie() async {
    final response = await http.get(Uri.parse(_southIndiaUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.formJson(movie)).toList();
    } else {
      throw Exception( 'Failed to load top-rated movies. Status Code: ${response.statusCode}');
    }
  }

  Future<List<Movie>> top10TvShow() async {
    final response = await http.get(Uri.parse(_top10ShowUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.formJson(movie)).toList();
    } else {
      throw Exception('Failed to load top-rated movies. Status Code: ${response.statusCode}');
    }
  }

    Future<List<Movie>> upcommingMovie() async {
      //after the uri.parse to convert the object to response value is like stauscode header and body
    final response = await http.get(Uri.parse(_upcommingUrl));
    if (response.statusCode == 200) {
      //Parses the JSON string in the response body into a Dart object.
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.formJson(movie)).toList();
    } else {
      throw Exception('Failed to load top-rated movies. Status Code: ${response.statusCode}');
    }
  }
  



   Future<List<Movie>> fetchAllMovies() async {
    try {
      final responses = await Future.wait([
        http.get(Uri.parse(_upcommingUrl2)),
        http.get(Uri.parse(_upcommingUrl)),
      ]);

      List<Movie> allMovies = [];
      for (var i = 0; i < responses.length; i++) {
        if (responses[i].statusCode == 200) {
          final decodeData = jsonDecode(responses[i].body)['results'] as List;
          final categoryMovies = decodeData.map((movie) => Movie.formJson(movie)).toList();

          switch (i) {
            case 0:
              allMovies.addAll(categoryMovies.map((movie) => movie..category = "Upcoming"));
              break;
            case 1:
              allMovies.addAll(categoryMovies.map((movie) => movie..category = "Upcoming2"));
              break;
          }
        } else {
          throw Exception('Failed to load movies from API ${i + 1}');
        }
      }

      return allMovies;
    } catch (e) {
      throw Exception('Failed to fetch all movies: $e');
    }
  }

     Future<List<Movie>> fetchAllCommingMovie() async {
    try {
      final responses = await Future.wait([
        http.get(Uri.parse(_commingsoon2)),
        http.get(Uri.parse(_commingsoon1)),
      ]);

      List<Movie> allMovies = [];
      for (var i = 0; i < responses.length; i++) {
        if (responses[i].statusCode == 200) {
          final decodeData = jsonDecode(responses[i].body)['results'] as List;
          final categoryMovies = decodeData.map((movie) => Movie.formJson(movie)).toList();

          switch (i) {
            case 0:
              allMovies.addAll(categoryMovies.map((movie) => movie..category = "commingSoon1"));
              break;
            case 1:
              allMovies.addAll(categoryMovies.map((movie) => movie..category = "commingSoon2"));
              break;
          }
        } else {
          throw Exception('Failed to load movies from API ${i + 1}');
        }
      }

      return allMovies;
    } catch (e) {
      throw Exception('Failed to fetch all movies: $e');
    }
  }
Future<List<Movie>> searchResult(String movie) async {
  if (movie.trim().isEmpty) {
    return []; 
  }
  String resultApi = "https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}&query=$movie";

  final response = await http.get(Uri.parse(resultApi));
  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body)["results"] as List;
    return responseData.map((movie) => Movie.formJson(movie)).toList();
  } else {
    throw Exception('Something went wrong');
  }
}
}




