class ApiBoxOffice {
  ApiBoxOffice({
    required this.budget,
    required this.openingWeekendUsa,
    required this.grossUsa,
    required this.cumulativeWorldwideGross,
  });

  final String budget;
  final String openingWeekendUsa;
  final String grossUsa;
  final String cumulativeWorldwideGross;

  factory ApiBoxOffice.fromJson(Map<String, dynamic> json) => ApiBoxOffice(
        budget: json["budget"],
        openingWeekendUsa: json["openingWeekendUSA"],
        grossUsa: json["grossUSA"],
        cumulativeWorldwideGross: json["cumulativeWorldwideGross"],
      );

  Map<String, dynamic> toJson() => {
        "budget": budget,
        "openingWeekendUSA": openingWeekendUsa,
        "grossUSA": grossUsa,
        "cumulativeWorldwideGross": cumulativeWorldwideGross,
      };
}
