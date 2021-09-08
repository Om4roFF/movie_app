import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/api/exception/api_exception.dart';
import 'package:movie_app/data/api/exception/serialize_exception.dart';
import 'package:movie_app/domain/model/movie.dart';
import 'package:movie_app/domain/model/youtube_trailer.dart';
import 'package:movie_app/internal/dependencies/repository_module.dart';

part 'movie_state.dart';
part 'movie_event.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(MovieState initialState) : super(initialState);

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieLoadEvent) {
      try {
      print(event.movieId);
      yield MovieLoadingState();
      final Movie movie =
          await RepositoryModule.movieRepository().fetchMovie(event.movieId);
      final YoutubeTrailer trailer = await RepositoryModule.movieRepository()
          .fetchYoutubeTrailer(event.movieId);
      yield MovieLoadedState(movie: movie, trailer: trailer);
      } catch (error) {
        print(error.toString());
        yield MovieErrorState('Error, please try again!!!');
      }
    }
  }
}
