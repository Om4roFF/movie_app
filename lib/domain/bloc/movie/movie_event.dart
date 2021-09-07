part of 'movie_bloc.dart';

abstract class MovieEvent {}

class MovieLoadEvent extends MovieEvent {
  final String movieId;

  MovieLoadEvent(this.movieId);
}
