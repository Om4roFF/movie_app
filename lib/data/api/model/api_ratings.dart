class ApiRatings {
  ApiRatings({
    required this.imDbId,
    required this.title,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.imDb,
    this.metacritic,
    this.theMovieDb,
    this.rottenTomatoes,
    this.tVCom,
    this.filmAffinity,
    this.errorMessage,
  });

  final String imDbId;
  final String title;
  final String fullTitle;
  final String type;
  final String year;
  final String imDb;
  final String? metacritic;
  final String? theMovieDb;
  final String? rottenTomatoes;
  final String? tVCom;
  final String? filmAffinity;
  final String? errorMessage;

  factory ApiRatings.fromJson(Map<String, dynamic> json) => ApiRatings(
        imDbId: json["imDbId"],
        title: json["title"],
        fullTitle: json["fullTitle"],
        type: json["type"],
        year: json["year"],
        imDb: json["imDb"],
        metacritic: json["metacritic"],
        theMovieDb: json["theMovieDb"],
        rottenTomatoes: json["rottenTomatoes"],
        tVCom: json["tV_com"],
        filmAffinity: json["filmAffinity"],
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "imDbId": imDbId,
        "title": title,
        "fullTitle": fullTitle,
        "type": type,
        "year": year,
        "imDb": imDb,
        "metacritic": metacritic,
        "theMovieDb": theMovieDb,
        "rottenTomatoes": rottenTomatoes,
        "tV_com": tVCom,
        "filmAffinity": filmAffinity,
        "errorMessage": errorMessage,
      };
}
