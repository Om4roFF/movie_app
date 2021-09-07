class ApiCompanyListElement {
  ApiCompanyListElement({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory ApiCompanyListElement.fromJson(Map<String, dynamic> json) =>
      ApiCompanyListElement(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
