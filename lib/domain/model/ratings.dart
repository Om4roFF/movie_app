class Ratings {
  Ratings({
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
}
