import 'package:flutter_play/movie_bloc/models/api/movie.dart';

class PopularMovies {
  int page;
  int totalResults;
  int totalPages;
  List<Movie> movies = [];

  PopularMovies.fromJson(Map<String, dynamic> json) {
    this.page = json["page"];
    this.totalResults = json["total_results"];
    this.totalPages = json["total_pages"];
    final moviesJson = json["results"];
    for (var movieJson in moviesJson) {
      var movie = Movie.fromJson(movieJson);
      movies.add(movie);
    }
  }
}