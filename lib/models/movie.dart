
class Movie {
  String title;
  String backDropPath;
  String originalTitile;
  String overview;
  String popularity;
  String poseterPath;
  String releaseDate;
  String relesedOn;
  String originalName; 
  String? category;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitile,
    required this.overview,
    required this.popularity,
    required this.poseterPath,
    required this.releaseDate,
    required this.relesedOn,
    required this.originalName,
    this.category, 
  });
   

  factory Movie.formJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"] ?? "Clear Cache and Cookies",
      backDropPath: json["backdrop_path"] ?? "",
      originalTitile: json["original_title"] ?? "",  
      originalName: json["original_name"] ?? "",  
      overview: json["overview"] ?? "",
      popularity: (json["popularity"] ?? 0.0).toString(),
      poseterPath: json["poster_path"] ?? "https://www.youtube.com/watch?v=GV3HUDMQ-F8",
      releaseDate: json["release_date"] ?? "",
      relesedOn: json["first_air_date"] ?? "",
    );
  }
}

