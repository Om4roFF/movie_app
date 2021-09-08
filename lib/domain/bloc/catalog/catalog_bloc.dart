import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/api/exception/api_exception.dart';
import 'package:movie_app/data/api/exception/serialize_exception.dart';
import 'package:movie_app/domain/model/movie_thumb.dart';
import 'package:movie_app/internal/dependencies/repository_module.dart';
part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc(CatalogState initialState) : super(initialState);

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    if (event is CatalogLoadTop250ImDb) {
      yield* _mapLoadTop250ImDb(event: event, state: state);
    } else if (event is CatalogLoadTop250Tvs) {
      yield* _mapLoadTop250TVs(event: event, state: state);
    } else if (event is CatalogLoadDramaMovies) {
      yield* _mapLoadDrama(event: event, state: state);
    } else if (event is CatalogLoadMostPopularMovies) {
      yield* _mapLoadMostPopularMovies(event: event, state: state);
    }
  }

  Stream<CatalogState> _mapLoadTop250ImDb(
      {required CatalogLoadTop250ImDb event,
      required CatalogState state}) async* {
    try {
      yield state.copyWith(status: CatalogStatus.loading);
      final List<MovieThumb> movies =
          await RepositoryModule.movieRepository().fetchTop250Movies();
      print(movies.length);
      yield state.copyWith(status: CatalogStatus.loaded, movies: movies);
    } catch (error) {
      print(error.toString());
      yield state.copyWith(status: CatalogStatus.error);
    }
  }

  Stream<CatalogState> _mapLoadTop250TVs(
      {required CatalogLoadTop250Tvs event,
      required CatalogState state}) async* {
    try {
      yield state.copyWith(status: CatalogStatus.loading);
      final List<MovieThumb> movies =
          await RepositoryModule.movieRepository().fetchTop250TVs();
      yield state.copyWith(status: CatalogStatus.loaded, movies: movies);
    } catch (error) {
      print(error.toString());
      yield state.copyWith(status: CatalogStatus.error);
    }
  }

  Stream<CatalogState> _mapLoadDrama(
      {required CatalogLoadDramaMovies event,
      required CatalogState state}) async* {
    try {
      yield state.copyWith(status: CatalogStatus.loading);
      final List<MovieThumb> movies =
          await RepositoryModule.movieRepository().fetchDramaMovies();
      yield state.copyWith(status: CatalogStatus.loaded, movies: movies);
    } catch (error) {
      print(error.toString());
      yield state.copyWith(status: CatalogStatus.error);
    }
  }

  Stream<CatalogState> _mapLoadMostPopularMovies(
      {required CatalogLoadMostPopularMovies event,
      required CatalogState state}) async* {
    try {
      yield state.copyWith(status: CatalogStatus.loading);
      final List<MovieThumb> movies =
          await RepositoryModule.movieRepository().fetchMostPopularMovies();
      yield state.copyWith(status: CatalogStatus.loaded, movies: movies);
    } catch (error) {
      print(error.toString());
      yield state.copyWith(status: CatalogStatus.error);
    }
  }
}
