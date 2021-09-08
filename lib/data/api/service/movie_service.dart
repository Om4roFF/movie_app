import 'package:flutter/foundation.dart';
import 'package:movie_app/data/api/exception/api_exception.dart';
import 'package:movie_app/data/api/model/api_movie.dart';
import 'package:movie_app/data/api/model/api_movie_thumb.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/data/api/model/api_youtube_trailer.dart';
import 'package:movie_app/data/api/parser.dart';
import 'package:movie_app/domain/app_config.dart';

class MovieService {
  Future<List<ApiMovieThumbnail>> fetchTop250Movies() async {
    final response = await http.get(Uri.parse(ApplicationConfig.BASE_URL +
        '/Top250Movies/' +
        ApplicationConfig.IMDB_TOKEN));

    if (response.statusCode == 200) {
      return await compute(Parser.parseMovies, response.body);
    }
    throw ApiException(
        message: 'error fetching top 250 movies',
        statusCode: response.statusCode);
  }

  Future<List<ApiMovieThumbnail>> fetchTop250TVs() async {
    final response = await http.get(Uri.parse(ApplicationConfig.BASE_URL +
        '/Top250TVs/' +
        ApplicationConfig.IMDB_TOKEN));

    if (response.statusCode == 200) {
      return await compute(Parser.parseMovies, response.body);
    }
    throw ApiException(
        message: 'error fetching top 250 movies',
        statusCode: response.statusCode);
  }

  Future<ApiMovie> fetchMovie(String movieId) async {
    final response = await http.get(Uri.parse(
        '${ApplicationConfig.BASE_URL}/Title/${ApplicationConfig.IMDB_TOKEN}/$movieId/Trailer,Ratings,Images'));
    if (response.statusCode == 200) {
      print(response.body);
      return await compute(Parser.parseMovie, response.body);
    }
    throw ApiException(
        message: 'error fetching movie $movieId}',
        statusCode: response.statusCode);
  }

  Future<ApiYoutubeTrailer> fetchYoutubeTrailer(String movieId) async {
    final response = await http.get(Uri.parse(
        '${ApplicationConfig.BASE_URL}/YouTubeTrailer/${ApplicationConfig.IMDB_TOKEN}/$movieId'));
    if (response.statusCode == 200) {
      return await compute(Parser.parseTrailer, response.body);
    }
    throw ApiException(
        message: 'error fetching youtube trailer $movieId}',
        statusCode: response.statusCode);
  }

  Future<List<ApiMovieThumbnail>> fetchMostPopularMovies() async {
    final response = await http.get(Uri.parse(
        '${ApplicationConfig.BASE_URL}/MostPopularMovies/${ApplicationConfig.IMDB_TOKEN}'));
    if (response.statusCode == 200) {
      return await compute(Parser.parseMovies, response.body);
    }
    throw ApiException(
        message: 'error fetching most popular movies',
        statusCode: response.statusCode);
  }

  Future<List<ApiMovieThumbnail>> fetchDramaMovies() async {
    final response = await http.get(Uri.parse(
        '${ApplicationConfig.BASE_URL}/Keyword/${ApplicationConfig.IMDB_TOKEN}/dramas'));
    if (response.statusCode == 200) {
      return await compute(Parser.parseMovies, response.body);
    }
    throw Exception('error fetching drama movies');
    // throw ApiException(
    //     message: 'error fetching drama movies',
    //     statusCode: response.statusCode);
  }
}
