part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieErrorCase extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movie;

  MovieLoaded(this.movie);
}
