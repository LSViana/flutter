import 'dart:convert';
import 'dart:io';
import 'package:flutter_play/movie_bloc/models/api/movie_trailer.dart';
import 'package:flutter_play/movie_bloc/models/api/popular_movies.dart';
import 'package:http/http.dart';
import 'package:flutter_play/movie_bloc/definitions/constants.dart';

class MovieApiProvider {
  Client client = Client();

  Future<PopularMovies> fetchPopularMovies() async {
    final response = await client
      .get('${Constants.tmdbApiRoot}/movie/popular?api_key=${Constants.tmdbApiKey}');
      if(response.statusCode == HttpStatus.ok) {
        return PopularMovies.fromJson(json.decode(response.body));
      } else {
        throw Exception('Couldn\'t list popular movies');
      }
  }

  Future<MovieTrailer> fetchMovieTrailer(int movieId) async {
    final response = await client
      .get('${Constants.tmdbApiRoot}/movie/$movieId/videos?api_key=${Constants.tmdbApiKey}');
    if(response.statusCode == HttpStatus.ok) {
      return MovieTrailer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Couldn\'t list movie\'s videos');
    }
  }

}