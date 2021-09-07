class ApiCountryListElement {
  ApiCountryListElement({
    required this.key,
    required this.value,
  });

  final String key;
  final String value;

  factory ApiCountryListElement.fromJson(Map<String, dynamic> json) =>
      ApiCountryListElement(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
