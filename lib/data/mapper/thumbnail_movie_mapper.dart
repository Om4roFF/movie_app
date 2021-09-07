import 'package:movie_app/data/api/model/api_movie_thumb.dart';
import 'package:movie_app/domain/model/movie_thumb.dart';

mixin ThumbnailMovieMapper {
  static MovieThumb fromApi(ApiMovieThumbnail movie) {
    return MovieThumb(
        id: movie.id,
        rank: movie.rank,
        title: movie.title,
        fullTitle: movie.fullTitle,
        year: movie.year,
        image: movie.image,
        crew: movie.crew,
        imDbRating: movie.imDbRating,
        imDbRatingCount: movie.imDbRatingCount);
  }

  static List<MovieThumb> fromApiList(List<ApiMovieThumbnail> movies) {
    return movies.map((movie) => fromApi(movie)).toList();
  }
}
