import 'package:movie_app/data/api/model/api_youtube_trailer.dart';
import 'package:movie_app/domain/model/youtube_trailer.dart';

mixin YoutubeTrailerMapper {
  static YoutubeTrailer fromApi(ApiYoutubeTrailer api) {
    return YoutubeTrailer(
      imDbId: api.imDbId,
      title: api.title,
      fullTitle: api.fullTitle,
      type: api.type,
      year: api.year,
      videoId: api.videoId,
      videoUrl: api.videoUrl,
      errorMessage: api.errorMessage,
    );
  }
}
