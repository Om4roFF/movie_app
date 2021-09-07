import 'package:flutter/foundation.dart';
import 'package:movie_app/data/api/service/movie_service.dart';
import 'package:movie_app/data/mapper/movie_mapper.dart';
import 'package:movie_app/data/mapper/thumbnail_movie_mapper.dart';
import 'package:movie_app/data/mapper/youtube_trailer_mapper.dart';
import 'package:movie_app/domain/model/movie.dart';
import 'package:movie_app/domain/model/movie_thumb.dart';
import 'package:movie_app/domain/model/youtube_trailer.dart';

class ApiUtil {
  final MovieService _movieService;

  ApiUtil(this._movieService);

  Future<List<MovieThumb>> fetchTop250Movies() async {
    final result = await _movieService.fetchTop250Movies();
    return await compute(ThumbnailMovieMapper.fromApiList, result);
  }

  Future<Movie> fetchMovie(String movieId) async {
    final result = await _movieService.fetchMovie(movieId);
    return await compute(MovieMapper.fromApi, result);
  }

  Future<List<MovieThumb>> fetchTop250TVs() async {
    final result = await _movieService.fetchTop250TVs();
    return await compute(ThumbnailMovieMapper.fromApiList, result);
  }

  Future<YoutubeTrailer> fetchYoutubeTrailer(String movieId) async {
    final result = await _movieService.fetchYoutubeTrailer(movieId);
    return await compute(YoutubeTrailerMapper.fromApi, result);
  }

  Future<List<MovieThumb>> fetchMostPopularMovies() async{
    final result = await _movieService.fetchMostPopularMovies();
    return await compute(ThumbnailMovieMapper.fromApiList, result);
  }

  Future<List<MovieThumb>> fetchDramaMovies() async{
    final result = await _movieService.fetchDramaMovies();
    return await compute(ThumbnailMovieMapper.fromApiList, result);
  }

}
