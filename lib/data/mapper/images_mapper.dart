import 'package:movie_app/data/api/model/api_images.dart';
import 'package:movie_app/domain/model/images.dart';

mixin ImagesMapper {
  static Images fromApi(ApiImages api) {
    return Images(
        imDbId: api.imDbId,
        title: api.title,
        fullTitle: api.fullTitle,
        type: api.type,
        year: api.year,
        items: fromApiItemsList(api.items),
        errorMessage: api.year);
  }

  static List<Images> fromApiList(List<ApiImages> api) {
    return api.map((movie) => fromApi(movie)).toList();
  }

  static Item fromApiItem(ApiItem api) {
    return Item(title: api.title, image: api.image);
  }

  static List<Item> fromApiItemsList(List<ApiItem> api) {
    return api.map((movie) => fromApiItem(movie)).toList();
  }
}
