import 'dart:convert';

import 'package:movie_app/data/api/exception/serialize_exception.dart';
import 'package:movie_app/data/api/model/api_movie_thumb.dart';
import 'package:movie_app/data/api/model/api_youtube_trailer.dart';

import 'model/api_movie.dart';

mixin Parser {
  static List<ApiMovieThumbnail> parseMovies(String responseBody) {
    try {
      final data = json.decode(responseBody);
      final List<dynamic> moviesJson = data['items'];
      final List<ApiMovieThumbnail> movies =
          moviesJson.map((json) => ApiMovieThumbnail.fromJson(json)).toList();
      return movies;
    } catch (error) {
      print(error.toString());
      throw SerializeException(message: 'error parse movies');
    }
  }

  static ApiMovie parseMovie(String responseBody) {
    try {
      final data = json.decode(responseBody);
      final movie = ApiMovie.fromJson(data);
      return movie;
    } catch (error) {
      print(error.toString());
      throw SerializeException(message: 'error parse movie');
    }
  }

  static ApiYoutubeTrailer parseTrailer(String responseBody) {
    try {
      final Map<String, dynamic> data = json.decode(responseBody);
      final apiYoutubeTrailer = ApiYoutubeTrailer.fromJson(data);
      return apiYoutubeTrailer;
    } catch (error) {
      print(error.toString());
      throw SerializeException(message: 'error parse youtube trailer');
    }
  }
}
