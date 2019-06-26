import 'package:flutter/material.dart';
import 'package:flutter_play/movie_bloc/blocs/movie_bloc.dart';
import 'package:flutter_play/movie_bloc/models/api/movie.dart';

class MovieDetails extends StatefulWidget {

  MovieDetails({
    Key key,
  }) : super(key: key);

  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: StreamBuilder(
          stream: movieBloc.selectedMovie,
          builder: (context, AsyncSnapshot<Movie> snapshot) {
            if(snapshot.hasData) {
              return createDetails(context, snapshot.data);
            } else if(snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget createDetails(BuildContext context, Movie movie) {
    return NestedScrollView(
      headerSliverBuilder: (context, bool) {
        return [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://image.tmdb.org/t/p/w400${movie.posterPath}",
                fit: BoxFit.cover,
              )
            ),
          ),
        ];
      },
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              movie.title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}