import 'package:flutter_play/movie_bloc/models/api/movie_trailer.dart';
import 'package:flutter_play/movie_bloc/models/api/popular_movies.dart';
import 'package:flutter_play/movie_bloc/resources/network/movie_api_provider.dart';

class MovieRepository {
  final movieApiProvider = MovieApiProvider();

  Future<PopularMovies> fetchPopularMovies() =>
    movieApiProvider.fetchPopularMovies();

  Future<MovieTrailer> fetchMovieTrailer(int movieId) =>
    movieApiProvider.fetchMovieTrailer(movieId);
}