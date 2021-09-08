part of 'catalog_bloc.dart';

abstract class CatalogEvent {}

class CatalogLoadTop250ImDb extends CatalogEvent {}

class CatalogLoadTop250Tvs extends CatalogEvent {}

class CatalogLoadDramaMovies extends CatalogEvent {}

class CatalogLoadMostPopularMovies extends CatalogEvent {}
