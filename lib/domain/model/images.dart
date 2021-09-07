class Images {
  Images({
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
  final List<Item> items;
  final String errorMessage;
}

class Item {
  Item({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;
}
