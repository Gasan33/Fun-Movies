import 'package:bloc/bloc.dart';
import 'package:fun_movies/Data/Model/movie.dart';
import 'package:fun_movies/Data/Repostary/movie_repostary.dart';
import 'package:meta/meta.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MoviesReposatry moviesReposatry;
  List<Movie> movie = [];

  MovieCubit(this.moviesReposatry) : super(MovieInitial());

  List<Movie> getOneMovie() {
    moviesReposatry.getOneMovie().then((movie) {
      emit(MovieLoaded(movie));
      this.movie = movie;
    });
    return movie;
  }
}
