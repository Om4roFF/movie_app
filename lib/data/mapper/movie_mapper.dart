import 'package:movie_app/data/api/model/api_movie.dart';
import 'package:movie_app/data/mapper/actor_mapper.dart';
import 'package:movie_app/data/mapper/box_office_mapper.dart';
import 'package:movie_app/data/mapper/company_mapper.dart';
import 'package:movie_app/data/mapper/images_mapper.dart';
import 'package:movie_app/data/mapper/rating_mapper.dart';
import 'package:movie_app/data/mapper/trailer_mapper.dart';
import 'package:movie_app/domain/model/company.dart';
import 'package:movie_app/domain/model/movie.dart';

mixin MovieMapper {
  static Movie fromApi(ApiMovie movie) {
    return Movie(
      id: movie.id,
      title: movie.title,
      fullTitle: movie.fullTitle,
      type: movie.type,
      year: movie.year,
      image: movie.image,
      releaseDate: movie.releaseDate,
      runtimeMins: movie.runtimeMins,
      runtimeStr: movie.runtimeStr,
      plot: movie.plot,
      directors: movie.directors,
      directorList: CompanyMapper.fromApiList(movie.directorList),
      writers: movie.writers,
      writerList: CompanyMapper.fromApiList(movie.writerList),
      stars: movie.stars,
      starList: CompanyMapper.fromApiList(movie.starList),
      actorList: ActorMapper.fromApiList(movie.actorList),
      countries: movie.countries,
      languages: movie.languages,
      contentRating: movie.contentRating,
      imDbRating: movie.imDbRating,
      imDbRatingVotes: movie.imDbRatingVotes,
      metacriticRating: movie.metacriticRating,
      ratings: RatingMapper.fromApi(movie.ratings),
      images: ImagesMapper.fromApi(movie.images),
      trailer: TrailerMapper.fromApi(movie.trailer!),
      boxOffice: BoxOfficeMapper.fromApi(movie.boxOffice!),
      companies: movie.companies,
      awards: movie.awards,
      genres: movie.genres,
    );
  }
}
