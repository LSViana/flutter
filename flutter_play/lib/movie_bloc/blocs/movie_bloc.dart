import 'package:flutter_play/movie_bloc/models/api/movie.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_play/movie_bloc/models/api/popular_movies.dart';
import 'package:flutter_play/movie_bloc/resources/repositories/movie_repository.dart';

class MovieBloc {

  int _selectedMovieId = -1;

  final _repository = MovieRepository();
  final movieSubject = BehaviorSubject<PopularMovies>();

  Observable<PopularMovies> get popularMovies =>
    movieSubject.stream
    .map((movies) {
      return movies;
    });

  Observable<Movie> get selectedMovie =>
    movieSubject.stream
    .expand((movies) {
      print('Expanding movies');
      return movies.movies;
    })
    .firstWhere((movie) {
      print('Filtering movies');
      return movie.id == _selectedMovieId;
    })
    .asObservable();

  void fetchPopularMovies() async {
    final popularMovies = await _repository.fetchPopularMovies();
    // Could be movieSubject.sink.add(...)
    movieSubject.add(popularMovies);
  }
  
  void selectMovie(int id) {
    if(id < 0) {
      throw Exception('Invalid \'id\' supplied');
    }
    _selectedMovieId = id;
  }

  dispose() {
    movieSubject.close();
  }
}

final movieBloc = MovieBloc();