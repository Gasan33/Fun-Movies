// ignore_for_file: duplicate_import

import 'package:fun_movies/Data/Apis/movie_apis.dart';
import 'package:fun_movies/Data/Apis/movie_apis.dart';
import 'package:fun_movies/Data/Model/movie.dart';

class MoviesReposatry {
  final MovieApis movieApis;

  MoviesReposatry(this.movieApis);

  Future<List<Movie>> getOneMovie() async {
    final movie = await movieApis.getOneMovie();
    return movie.map((movie) => Movie.fromJson(movie)).toList();
  }
}
