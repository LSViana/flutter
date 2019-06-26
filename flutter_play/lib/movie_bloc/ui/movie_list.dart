import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }

}

class MovieListState extends State<MovieList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Movies'
      ),
    );
  }

}