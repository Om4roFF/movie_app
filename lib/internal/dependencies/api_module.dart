import 'package:movie_app/data/api/api_util.dart';
import 'package:movie_app/data/api/service/movie_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(MovieService());
    }
    return _apiUtil!;
  }
}
