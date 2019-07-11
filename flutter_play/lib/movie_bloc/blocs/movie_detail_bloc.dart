import 'package:flutter_play/movie_bloc/models/api/movie_trailer.dart';
import 'package:flutter_play/movie_bloc/resources/repositories/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc {
  final _movieRepository = MovieRepository();
  final _movieIdSubject = PublishSubject<int>();
  final _trailerSubject = BehaviorSubject<Future<MovieTrailer>>();

  void Function(int) get fetchTrailersByMovieId => _movieIdSubject.sink.add;
  Observable<Future<MovieTrailer>> get movieTrailers => _trailerSubject.stream;

  MovieDetailBloc() {
    _movieIdSubject
      .stream
      .transform(_itemTransformer())
      .pipe(_trailerSubject);
  }

  dispose() async {
    _movieIdSubject.close();
    await _trailerSubject.drain();
    _trailerSubject.close();
  }

  ScanStreamTransformer<int, Future<MovieTrailer>> _itemTransformer() {
    return ScanStreamTransformer(
      (Future<MovieTrailer> futureTrailer, int id, int index) {
        futureTrailer = _movieRepository.fetchMovieTrailer(id);
        return futureTrailer;
      }
    );
  }

}