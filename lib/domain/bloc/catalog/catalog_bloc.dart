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
      try {
        yield state.copyWith(status: CatalogStatus.loading);
        final List<MovieThumb> movies =
            await RepositoryModule.movieRepository().fetchTop250Movies();
        print(movies.length);
        yield state.copyWith(status: CatalogStatus.loaded, movies: movies);
      } on ApiException catch (error) {
        print('Api Error');
        print(error.message);
        print(error.statusCode);
        yield state.copyWith(status: CatalogStatus.error);
      } on SerializeException catch (error) {
        print('parse error');
        print(error.message);
        yield state.copyWith(status: CatalogStatus.error);
      } catch (error) {
        print(error.toString());
        yield state.copyWith(status: CatalogStatus.error);
      }
    } else if (event is CatalogLoadTop250Tvs) {
      try {
        yield state.copyWith(status: CatalogStatus.loading);
        final List<MovieThumb> movies =
            await RepositoryModule.movieRepository().fetchTop250TVs();
        yield state.copyWith(status: CatalogStatus.loaded, movies: movies);
      } on ApiException catch (error) {
        print('Api Error');
        print(error.message);
        print(error.statusCode);
        yield state.copyWith(status: CatalogStatus.error);
      } on SerializeException catch (error) {
        print('parse error');
        print(error.message);
        yield state.copyWith(status: CatalogStatus.error);
      } catch (error) {
        print(error.toString());
        yield state.copyWith(status: CatalogStatus.error);
      }
    }
  }
}
