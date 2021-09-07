class ApiSimilar {
  ApiSimilar({
    required this.id,
    required this.title,
    required this.fullTitle,
    required this.year,
    required this.image,
    required this.plot,
    required this.directors,
    required this.stars,
    required this.genres,
    required this.imDbRating,
  });

  final String id;
  final String title;
  final String fullTitle;
  final String year;
  final String image;
  final String plot;
  final String directors;
  final String stars;
  final String genres;
  final String imDbRating;

  factory ApiSimilar.fromJson(Map<String, dynamic> json) => ApiSimilar(
        id: json["id"],
        title: json["title"],
        fullTitle: json["fullTitle"],
        year: json["year"],
        image: json["image"],
        plot: json["plot"],
        directors: json["directors"],
        stars: json["stars"],
        genres: json["genres"],
        imDbRating: json["imDbRating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "fullTitle": fullTitle,
        "year": year,
        "image": image,
        "plot": plot,
        "directors": directors,
        "stars": stars,
        "genres": genres,
        "imDbRating": imDbRating,
      };
}
