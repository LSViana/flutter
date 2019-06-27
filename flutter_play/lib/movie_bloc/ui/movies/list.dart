import 'package:flutter/material.dart';
import 'package:flutter_play/movie_bloc/blocs/movie_bloc.dart';
import 'package:flutter_play/movie_bloc/models/api/movie.dart';
import 'package:flutter_play/movie_bloc/models/api/popular_movies.dart';
import 'package:flutter_play/movie_bloc/ui/movies/details.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: StreamBuilder(
            stream: movieBloc.popularMovies,
            builder: (context, AsyncSnapshot<PopularMovies> snapshot) {
              if (snapshot.hasData) {
                return buildMovieList(snapshot.data);
              } else if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        )
      ],
    ));
  }

  void fetchPopularMovies() => movieBloc.fetchPopularMovies();

  Widget buildMovieList(PopularMovies data) {
    return GridView.builder(
      itemCount: data.movies.length,
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        var movie = data.movies[index];
        return new MovieCard(movie: movie);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    // This call avoids memory leak
    movieBloc.dispose();
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.selectAndOpenMovie(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(8)),
          image: DecorationImage(
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w185${movie.posterPath}'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(8),
                  topRight: const Radius.circular(8),
                ),
                color: Colors.black54,
              ),
              child: Text(
                movie.title,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectAndOpenMovie(BuildContext context) async {
    movieBloc.selectMovie(movie.id);
    Future.delayed(Duration(seconds: 3), () {
      print('Changing ${movie.title} to ${movie.title}!');
      movie.title += '!';
      print(movieBloc.movieSubject.value.movies[0].title);
      movieBloc.movieSubject.sink.add(movieBloc.movieSubject.value);

    });
    Future.delayed(Duration(seconds: 1), () async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MovieDetails();
          },
        ),
      );
    });
  }
}
