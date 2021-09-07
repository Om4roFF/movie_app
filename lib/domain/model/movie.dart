import 'package:movie_app/domain/model/ratings.dart';
import 'package:movie_app/domain/model/similar.dart';
import 'package:movie_app/domain/model/trailer.dart';

import 'actors.dart';
import 'box_office.dart';
import 'company.dart';
import 'country.dart';
import 'images.dart';

class Movie {
  Movie({
    required this.id,
    required this.title,
    this.originalTitle,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.image,
    required this.releaseDate,
    required this.runtimeMins,
    required this.runtimeStr,
    required this.plot,
    this.plotLocal,
    this.plotLocalIsRtl,
    this.awards,
    required this.directors,
    required this.directorList,
    required this.writers,
    required this.writerList,
    required this.stars,
    required this.starList,
    required this.actorList,
    this.genres,
    this.genreList,
    this.companies,
    this.companyList,
    required this.countries,
    this.countryList,
    required this.languages,
    this.languageList,
    required this.contentRating,
    required this.imDbRating,
    required this.imDbRatingVotes,
    required this.metacriticRating,
    required this.ratings,
    required this.images,
    this.trailer,
    this.boxOffice,
    this.tagline,
    this.keywords,
    this.keywordList,
    this.similars,
    this.errorMessage,
  });

  final String id;
  final String title;
  final String? originalTitle;
  final String fullTitle;
  final String type;
  final String year;
  final String image;
  final DateTime releaseDate;
  final String runtimeMins;
  final String runtimeStr;
  final String plot;
  final String? plotLocal;
  final bool? plotLocalIsRtl;
  final String? awards;
  final String directors;
  final List<CompanyListElement> directorList;
  final String writers;
  final List<CompanyListElement> writerList;
  final String stars;
  final List<CompanyListElement> starList;
  final List<ActorList> actorList;
  final String? genres;
  final List<CountryListElement>? genreList;
  final String? companies;
  final List<CompanyListElement>? companyList;
  final String countries;
  final List<CountryListElement>? countryList;
  final String languages;
  final List<CountryListElement>? languageList;
  final String contentRating;
  final String imDbRating;
  final String imDbRatingVotes;
  final String metacriticRating;
  final Ratings ratings;
  final Images images;
  final Trailer? trailer;
  final BoxOffice? boxOffice;
  final String? tagline;
  final String? keywords;
  final List<String>? keywordList;
  final List<Similar>? similars;
  final String? errorMessage;
}
