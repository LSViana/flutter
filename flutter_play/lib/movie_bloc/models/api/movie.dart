class Movie {
  int id;
  int voteCount;
  double voteAverage;
  double popularity;
  String title;
  String posterPath;
  String releaseDate;

  Movie.fromJson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.posterPath = json["poster_path"];
    this.releaseDate = json["release_date"];
    this.id = json["id"];
    this.voteAverage = (json["vote_average"] as num).toDouble();
    this.voteCount = json["vote_count"];
    this.popularity = (json["popularity"] as num).toDouble();
  }
}