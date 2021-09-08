// To parse this JSON data, do
//
//     final apiMovie = apiMovieFromJson(jsonString);

import 'dart:convert';

import 'api_actors.dart';
import 'api_company.dart';
import 'api_country.dart';
import 'api_images.dart';
import 'api_ratings.dart';
import 'api_similar.dart';
import 'api_trailer.dart';
import 'api_box_office.dart';

class ApiMovie {
  ApiMovie({
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
  final List<ApiCompanyListElement> directorList;
  final String writers;
  final List<ApiCompanyListElement> writerList;
  final String stars;
  final List<ApiCompanyListElement> starList;
  final List<ApiActorList> actorList;
  final String? genres;
  final List<ApiCountryListElement>? genreList;
  final String? companies;
  final List<ApiCompanyListElement>? companyList;
  final String countries;
  final List<ApiCountryListElement>? countryList;
  final String languages;
  final List<ApiCountryListElement>? languageList;
  final String contentRating;
  final String imDbRating;
  final String imDbRatingVotes;
  final String metacriticRating;
  final ApiRatings ratings;
  final ApiImages images;
  final ApiTrailer? trailer;
  final ApiBoxOffice? boxOffice;
  final String? tagline;
  final String? keywords;
  final List<String>? keywordList;
  final List<ApiSimilar>? similars;
  final String? errorMessage;

  factory ApiMovie.fromJson(Map<String, dynamic> json) => ApiMovie(
        id: json["id"],
        title: json["title"] ?? '',
        originalTitle: json["originalTitle"] ?? '',
        fullTitle: json["fullTitle"] ?? '',
        type: json["type"] ?? '',
        year: json["year"] ?? '',
        images: ApiImages.fromJson(json["images"]),
        releaseDate: DateTime.parse(json["releaseDate"]),
        runtimeMins: json["runtimeMins"],
        runtimeStr: json["runtimeStr"],
        plot: json["plot"],
        plotLocal: json["plotLocal"],
        plotLocalIsRtl: json["plotLocalIsRtl"],
        awards: json["awards"],
        directors: json["directors"],
        directorList: List<ApiCompanyListElement>.from(
          json["directorList"].map(
            (x) => ApiCompanyListElement.fromJson(x),
          ),
        ),
        writers: json["writers"],
        writerList: List<ApiCompanyListElement>.from(
          json["writerList"].map(
            (x) => ApiCompanyListElement.fromJson(x),
          ),
        ),
        stars: json["stars"],
        starList: List<ApiCompanyListElement>.from(
          json["starList"].map(
            (x) => ApiCompanyListElement.fromJson(x),
          ),
        ),
        actorList: List<ApiActorList>.from(
          json["actorList"].map(
            (x) => ApiActorList.fromJson(x),
          ),
        ),
        genres: json["genres"],
        genreList: List<ApiCountryListElement>.from(
          json["genreList"].map(
            (x) => ApiCountryListElement.fromJson(x),
          ),
        ),
        companies: json["companies"],
        companyList: List<ApiCompanyListElement>.from(
          json["companyList"].map(
            (x) => ApiCompanyListElement.fromJson(x),
          ),
        ),
        countries: json["countries"],
        countryList: List<ApiCountryListElement>.from(
          json["countryList"].map(
            (x) => ApiCountryListElement.fromJson(x),
          ),
        ),
        languages: json["languages"],
        languageList: List<ApiCountryListElement>.from(
          json["languageList"].map(
            (x) => ApiCountryListElement.fromJson(x),
          ),
        ),
        contentRating: json["contentRating"],
        imDbRating: json["imDbRating"],
        imDbRatingVotes: json["imDbRatingVotes"],
        metacriticRating: json["metacriticRating"],
        ratings: ApiRatings.fromJson(json["ratings"]),
        trailer: ApiTrailer.fromJson(json["trailer"]),
        boxOffice: ApiBoxOffice.fromJson(json["boxOffice"]),
        tagline: json["tagline"],
        keywords: json["keywords"],
        keywordList: List<String>.from(
          json["keywordList"].map((x) => x),
        ),
        similars: List<ApiSimilar>.from(
          json["similars"].map(
            (x) => ApiSimilar.fromJson(x),
          ),
        ),
        errorMessage: json["errorMessage"],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "originalTitle": originalTitle,
        "fullTitle": fullTitle,
        "type": type,
        "year": year,
        "image": image,
        "releaseDate":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "runtimeMins": runtimeMins,
        "runtimeStr": runtimeStr,
        "plot": plot,
        "plotLocal": plotLocal,
        "plotLocalIsRtl": plotLocalIsRtl,
        "awards": awards,
        "directors": directors,
        "directorList": List<dynamic>.from(directorList.map((x) => x.toJson())),
        "writers": writers,
        "writerList": List<dynamic>.from(writerList.map((x) => x.toJson())),
        "stars": stars,
        "starList": List<dynamic>.from(starList.map((x) => x.toJson())),
        "actorList": List<dynamic>.from(actorList.map((x) => x.toJson())),
        "genres": genres,
        "genreList": List<dynamic>.from(
          genreList!.map(
            (x) => x.toJson(),
          ),
        ),
        "companies": companies,
        "companyList": List<dynamic>.from(
          companyList!.map(
            (x) => x.toJson(),
          ),
        ),
        "countries": countries,
        "countryList": List<dynamic>.from(
          countryList!.map(
            (x) => x.toJson(),
          ),
        ),
        "languages": languages,
        "languageList": List<dynamic>.from(
          languageList!.map(
            (x) => x.toJson(),
          ),
        ),
        "contentRating": contentRating,
        "imDbRating": imDbRating,
        "imDbRatingVotes": imDbRatingVotes,
        "metacriticRating": metacriticRating,
        "ratings": ratings.toJson(),
        "images": images,
        "trailer": trailer!.toJson(),
        "boxOffice": boxOffice!.toJson(),
        "tagline": tagline,
        "keywords": keywords,
        "keywordList": List<dynamic>.from(
          keywordList!.map((x) => x),
        ),
        "similars": List<dynamic>.from(
          similars!.map(
            (x) => x.toJson(),
          ),
        ),
        "errorMessage": errorMessage,
      };
}
