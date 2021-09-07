import 'package:movie_app/data/api/model/api_ratings.dart';
import 'package:movie_app/domain/model/ratings.dart';

mixin RatingMapper {
  static Ratings fromApi(ApiRatings api) {
    return Ratings(
      type: api.type,
      year: api.year,
      imDbId: api.imDbId,
      title: api.title,
      fullTitle: api.fullTitle,
      imDb: api.imDb,
      metacritic: api.metacritic,
      rottenTomatoes: api.rottenTomatoes,
      filmAffinity: api.filmAffinity,
      errorMessage: api.errorMessage,
      tVCom: api.tVCom,
      theMovieDb: api.theMovieDb,
    );
  }

  static List<Ratings> fromApiList(List<ApiRatings> api) {
    return api.map((movie) => fromApi(movie)).toList();
  }
}
