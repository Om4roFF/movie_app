import 'package:movie_app/domain/model/movie.dart';
import 'package:movie_app/domain/model/movie_thumb.dart';
import 'package:movie_app/domain/model/youtube_trailer.dart';

abstract class MovieRepository {
  Future<List<MovieThumb>> fetchTop250Movies();
  Future<List<MovieThumb>> fetchTop250TVs();
  Future<Movie> fetchMovie(String movieId);
  Future<YoutubeTrailer> fetchYoutubeTrailer(String movieId);
  Future<List<MovieThumb>> fetchDramaMovies();
  Future<List<MovieThumb>> fetchMostPopularMovies();
}
