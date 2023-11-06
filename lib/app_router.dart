import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_movies/Bussnies_Logic/cubit/movie_cubit.dart';
import 'package:fun_movies/Constants/strings.dart';
import 'package:fun_movies/Data/Apis/movie_apis.dart';
import 'package:fun_movies/Data/Model/movie.dart';
import 'package:fun_movies/Data/Repostary/movie_repostary.dart';
import 'package:fun_movies/Presintation/Screens/movie_detal_screen.dart';
import 'package:fun_movies/Presintation/Screens/movie_screen.dart';

class AppRouter {
  late MoviesReposatry moviesReposatry;
  late MovieCubit movieCubit;
  AppRouter() {
    moviesReposatry = MoviesReposatry(MovieApis());
    movieCubit = MovieCubit(moviesReposatry);
  }

  Route? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case movieScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => MovieCubit(moviesReposatry),
            child: const MovieScreen(),
          ),
        );
      case movieDetalScreen:
        final movie = settings.arguments as Movie;
        return MaterialPageRoute(
            builder: (_) => MovieDetalScreen(
                  movie: movie,
                ));
    }
    return null;
  }
}
