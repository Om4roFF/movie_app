import 'package:movie_app/data/api/model/api_trailer.dart';
import 'package:movie_app/domain/model/trailer.dart';

mixin TrailerMapper {
  static Trailer fromApi(ApiTrailer api) {
    return Trailer(
        imDbId: api.imDbId,
        title: api.title,
        fullTitle: api.fullTitle,
        type: api.type,
        year: api.year,
        videoId: api.videoId,
        videoTitle: api.videoTitle,
        videoDescription: api.videoDescription,
        thumbnailUrl: api.thumbnailUrl,
        uploadDate: api.uploadDate,
        link: api.link,
        linkEmbed: api.linkEmbed,
        errorMessage: api.errorMessage);
  }

  static List<Trailer> fromApiList(List<ApiTrailer> api) {
    return api.map((movie) => fromApi(movie)).toList();
  }
}
