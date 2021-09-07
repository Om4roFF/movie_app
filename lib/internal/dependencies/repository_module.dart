import 'package:movie_app/data/repository/movie_data_repository.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';
import 'package:movie_app/internal/dependencies/api_module.dart';

mixin RepositoryModule {
  static MovieRepository? _movieRepository;

  static MovieRepository movieRepository() {
    if (_movieRepository == null) {
      _movieRepository = MovieDataRepository(ApiModule.apiUtil());
    }
    return _movieRepository!;
  }
}
