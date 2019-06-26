import 'package:flutter/material.dart';
import 'package:flutter_play/movie_bloc/ui/movies/list.dart';

class MovieApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData
        .dark()
        .copyWith(
          primaryColor: Colors.red[900],
        ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Movie List',
          ),
        ),
        body: MovieList(),
      ),
    );
  }

}