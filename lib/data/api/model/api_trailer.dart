class ApiTrailer {
  ApiTrailer({
    required this.imDbId,
    required this.title,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.videoId,
    required this.videoTitle,
    required this.videoDescription,
    required this.thumbnailUrl,
    required this.uploadDate,
    required this.link,
    required this.linkEmbed,
    required this.errorMessage,
  });

  final String imDbId;
  final String title;
  final String fullTitle;
  final String type;
  final String year;
  final String videoId;
  final String videoTitle;
  final String videoDescription;
  final String thumbnailUrl;
  final String uploadDate;
  final String link;
  final String linkEmbed;
  final String errorMessage;

  factory ApiTrailer.fromJson(Map<String, dynamic> json) => ApiTrailer(
        imDbId: json["imDbId"],
        title: json["title"],
        fullTitle: json["fullTitle"],
        type: json["type"],
        year: json["year"],
        videoId: json["videoId"],
        videoTitle: json["videoTitle"],
        videoDescription: json["videoDescription"],
        thumbnailUrl: json["thumbnailUrl"],
        uploadDate: json["uploadDate"],
        link: json["link"],
        linkEmbed: json["linkEmbed"],
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "imDbId": imDbId,
        "title": title,
        "fullTitle": fullTitle,
        "type": type,
        "year": year,
        "videoId": videoId,
        "videoTitle": videoTitle,
        "videoDescription": videoDescription,
        "thumbnailUrl": thumbnailUrl,
        "uploadDate": uploadDate,
        "link": link,
        "linkEmbed": linkEmbed,
        "errorMessage": errorMessage,
      };
}
