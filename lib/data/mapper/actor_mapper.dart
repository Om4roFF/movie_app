import 'package:movie_app/data/api/model/api_actors.dart';
import 'package:movie_app/domain/model/actors.dart';

mixin ActorMapper {
  static ActorList fromApi(ApiActorList api) {
    return ActorList(
        id: api.id,
        name: api.name,
        image: api.image,
        asCharacter: api.asCharacter);
  }

  static List<ActorList> fromApiList(List<ApiActorList> api) {
    return api.map((movie) => fromApi(movie)).toList();
  }
}
