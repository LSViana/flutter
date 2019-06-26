import 'package:flutter/material.dart';
import 'package:flutter_play/movie_bloc/ui/movie_list.dart';

class MovieApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MovieList(),
      ),
    );
  }

}