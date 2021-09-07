part of 'catalog_bloc.dart';

enum CatalogStatus {
  loading,
  loaded,
  error,
  none,
}

class CatalogState {
  final CatalogStatus status;
  final List<MovieThumb>? movies;

  CatalogState({this.status = CatalogStatus.none, this.movies});

  CatalogState copyWith({CatalogStatus? status, List<MovieThumb>? movies}) {
    return CatalogState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
    );
  }
}
