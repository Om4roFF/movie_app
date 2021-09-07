class ApiActorList {
  ApiActorList({
    required this.id,
    required this.image,
    required this.name,
    required this.asCharacter,
  });

  final String id;
  final String image;
  final String name;
  final String asCharacter;

  factory ApiActorList.fromJson(Map<String, dynamic> json) => ApiActorList(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        asCharacter: json["asCharacter"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "asCharacter": asCharacter,
      };
}
