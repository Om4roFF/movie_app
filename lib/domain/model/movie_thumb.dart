class MovieThumb {
  final String id;
  final String rank;
  final String title;
  final String fullTitle;
  final String year;
  final String image;
  final String crew;
  final String imDbRating;
  final String imDbRatingCount;

  MovieThumb(
      {required this.id,
      required this.rank,
      required this.title,
      required this.fullTitle,
      required this.year,
      required this.image,
      required this.crew,
      required this.imDbRating,
      required this.imDbRatingCount});
}
