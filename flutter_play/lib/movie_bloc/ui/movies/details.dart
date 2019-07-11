import 'package:flutter/material.dart';
import 'package:flutter_play/movie_bloc/blocs/movie_bloc.dart';
import 'package:flutter_play/movie_bloc/blocs/movie_detail_bloc.dart';
import 'package:flutter_play/movie_bloc/models/api/movie.dart';
import 'package:flutter_play/movie_bloc/providers/movie_detail_bloc_provider.dart';

class MovieDetails extends StatefulWidget {

  final int movieId;

  MovieDetails({
    Key key,
    @required this.movieId
  }) : super(key: key);

  _MovieDetailsState createState() => _MovieDetailsState();

}

class _MovieDetailsState extends State<MovieDetails> {

  MovieDetailBloc bloc;

  /*
    This method is called when something changes that is supplied to the widget changes,
    but it's better to perform the operations here instead of build, since that it is called
    only when values change and not, when, for example, the parent of this widget rebuilds
    and make this one rebuild too
  */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = MovieDetailBlocProvider.of(context);
    bloc.fetchTrailersByMovieId(widget.movieId);
  }

  // The async used in this method isn't standard, but is, surprisingly, accepted
  @override
  void dispose() async {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: StreamBuilder(
          stream: movieBloc.selectedMovie,
          builder: (context, AsyncSnapshot<Movie> snapshot) {
            print('Building list ${snapshot.hasData}');
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