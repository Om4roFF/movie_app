part of 'movie_bloc.dart';

abstract class MovieState {}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  final Movie movie;
  final YoutubeTrailer? trailer;
  MovieLoadedState({required this.movie, this.trailer});
}

class MovieErrorState extends MovieState {
  final String errorMessage;

  MovieErrorState(this.errorMessage);
}
