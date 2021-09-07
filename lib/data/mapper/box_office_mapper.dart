import 'package:movie_app/data/api/model/api_box_office.dart';
import 'package:movie_app/domain/model/box_office.dart';

mixin BoxOfficeMapper {
  static BoxOffice fromApi(ApiBoxOffice api) {
    return BoxOffice(
        budget: api.budget,
        openingWeekendUsa: api.openingWeekendUsa,
        grossUsa: api.grossUsa,
        cumulativeWorldwideGross: api.cumulativeWorldwideGross);
  }

  static List<BoxOffice> fromApiList(List<ApiBoxOffice> api) {
    return api.map((movie) => fromApi(movie)).toList();
  }
}
