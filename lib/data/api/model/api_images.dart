class ApiImages {
  ApiImages({
    required this.imDbId,
    required this.title,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.items,
    required this.errorMessage,
  });

  final String imDbId;
  final String title;
  final String fullTitle;
  final String type;
  final String year;
  final List<ApiItem> items;
  final String errorMessage;

  factory ApiImages.fromJson(Map<String, dynamic> json) => ApiImages(
        imDbId: json["imDbId"],
        title: json["title"] ?? '',
        fullTitle: json["fullTitle"] ?? '',
        type: json["type"] ?? '',
        year: json["year"] ?? '',
        items:
            List<ApiItem>.from(json["items"].map((x) => ApiItem.fromJson(x))),
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "imDbId": imDbId,
        "title": title,
        "fullTitle": fullTitle,
        "type": type,
        "year": year,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "errorMessage": errorMessage,
      };
}

class ApiItem {
  ApiItem({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  factory ApiItem.fromJson(Map<String, dynamic> json) => ApiItem(
        title: json["title"] ?? '',
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
      };
}
