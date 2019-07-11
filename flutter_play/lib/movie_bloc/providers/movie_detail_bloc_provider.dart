import 'package:flutter/material.dart';
import 'package:flutter_play/movie_bloc/blocs/movie_detail_bloc.dart';

class MovieDetailBlocProvider extends InheritedWidget {

  final movieDetailBloc;

  MovieDetailBlocProvider({
    Key key,
    Widget child,
  }) :
  movieDetailBloc = MovieDetailBloc(),
  super(key: key, child: child);
  
  // This code comes from the tutorial, it may be refactored later
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MovieDetailBloc of(BuildContext context) {
    final widget = context
      .inheritFromWidgetOfExactType(MovieDetailBlocProvider) as MovieDetailBlocProvider;
    if(widget != null)
      return widget.movieDetailBloc;
    //
    throw Exception('Couldn\'t get the expected widget of type $MovieDetailBlocProvider');
  }

}