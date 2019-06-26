import 'package:flutter_play/movie_bloc/models/api/movie.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_play/movie_bloc/models/api/popular_movies.dart';
import 'package:flutter_play/movie_bloc/resources/repositories/movie_repository.dart';

class MovieBloc {

  int _selectedMovieId = -1;

  final _repository = MovieRepository();
  final _movieSubject = BehaviorSubject<PopularMovies>();

  Stream<PopularMovies> get popularMovies =>
    _movieSubject.stream;

  Stream<Movie> get selectedMovie =>
    _movieSubject.stream
    .expand((movies) => movies.movies)
    .firstWhere((movie) => movie.id == _selectedMovieId)
    .asStream();

  void fetchPopularMovies() async {
    final popularMovies = await _repository.fetchPopularMovies();
    // Could be _movieSubject.sink.add(...)
    _movieSubject.add(popularMovies);
  }
  
  void selectMovie(int id) {
    if(id < 0) {
      throw Exception('Invalid \'id\' supplied');
    }
    _selectedMovieId = id;
  }

  dispose() {
    _movieSubject.close();
  }
}

final movieBloc = MovieBloc();