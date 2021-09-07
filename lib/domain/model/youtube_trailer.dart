class YoutubeTrailer {
  YoutubeTrailer({
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
}
