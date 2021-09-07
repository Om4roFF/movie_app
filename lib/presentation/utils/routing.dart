import 'package:flutter/material.dart';
import 'package:movie_app/domain/bloc/catalog/catalog_bloc.dart';
import 'package:movie_app/presentation/catalog/catalog.dart';

class Routing {
  static toCatalogPage(
    BuildContext context, {
    required String title,
    required CatalogEvent event,
  }) {
    final route = materialRoute(
      Catalog(
        title: title,
        event: event,
      ),
    );
    Navigator.of(context).push(route);
  }

  static MaterialPageRoute materialRoute(Widget destination) {
    return MaterialPageRoute(
      builder: (context) => destination,
      settings: RouteSettings(
        name: destination.toString(),
      ),
    );
  }

  static MaterialPageRoute modalRoute(
      Widget destination, bool fullscreenDialog) {
    return MaterialPageRoute(
      builder: (context) => destination,
      fullscreenDialog: fullscreenDialog,
      settings: RouteSettings(
        name: destination.toString(),
      ),
    );
  }
}
