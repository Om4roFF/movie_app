// To parse this JSON data, do
//
//     final apiYoutubeTrailer = apiYoutubeTrailerFromJson(jsonString);

import 'dart:convert';

ApiYoutubeTrailer apiYoutubeTrailerFromJson(String str) =>
    ApiYoutubeTrailer.fromJson(json.decode(str));

String apiYoutubeTrailerToJson(ApiYoutubeTrailer data) =>
    json.encode(data.toJson());

class ApiYoutubeTrailer {
  ApiYoutubeTrailer({
    required this.imDbId,
    required this.title,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.videoId,
    required this.videoUrl,
    required this.errorMessage,
  });

  final String imDbId;
  final String title;
  final String fullTitle;
  final String type;
  final String year;
  final String videoId;
  final String videoUrl;
  final String errorMessage;

  factory ApiYoutubeTrailer.fromJson(Map<String, dynamic> json) =>
      ApiYoutubeTrailer(
        imDbId: json["imDbId"],
        title: json["title"],
        fullTitle: json["fullTitle"],
        type: json["type"],
        year: json["year"],
        videoId: json["videoId"],
        videoUrl: json["videoUrl"],
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "imDbId": imDbId,
        "title": title,
        "fullTitle": fullTitle,
        "type": type,
        "year": year,
        "videoId": videoId,
        "videoUrl": videoUrl,
        "errorMessage": errorMessage,
      };
}
