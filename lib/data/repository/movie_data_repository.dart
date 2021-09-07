import 'package:movie_app/data/api/api_util.dart';
import 'package:movie_app/domain/model/movie.dart';
import 'package:movie_app/domain/model/movie_thumb.dart';
import 'package:movie_app/domain/model/youtube_trailer.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

class MovieDataRepository extends MovieRepository {
  final ApiUtil _apiUtil;

  MovieDataRepository(this._apiUtil);

  @override
  Future<List<MovieThumb>> fetchTop250Movies() {
    return _apiUtil.fetchTop250Movies();
  }

  @override
  Future<Movie> fetchMovie(String movieId) {
    return _apiUtil.fetchMovie(movieId);
  }

  @override
  Future<List<MovieThumb>> fetchTop250TVs() {
    return _apiUtil.fetchTop250TVs();
  }

  @override
  Future<YoutubeTrailer> fetchYoutubeTrailer(String movieId) {
    return _apiUtil.fetchYoutubeTrailer(movieId);
  }

  @override
  Future<List<MovieThumb>> fetchDramaMovies() {
    return _apiUtil.fetchDramaMovies();
  }

  @override
  Future<List<MovieThumb>> fetchMostPopularMovies() {
    return _apiUtil.fetchMostPopularMovies();
  }
}
