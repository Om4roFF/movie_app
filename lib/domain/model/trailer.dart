class Trailer {
  Trailer({
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
}
