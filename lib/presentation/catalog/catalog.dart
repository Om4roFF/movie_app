import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/domain/bloc/catalog/catalog_bloc.dart';
import 'package:movie_app/domain/model/movie_thumb.dart';
import 'package:movie_app/presentation/catalog/movie_thumbnail.dart';
import 'package:pagination_view/pagination_view.dart';

class Catalog extends StatelessWidget {
  final String title;
  final CatalogEvent event;
  const Catalog({Key? key, required this.title, required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return CatalogBloc(CatalogState())..add(event);
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: BlocConsumer<CatalogBloc, CatalogState>(
            listener: (context, state) {
              if (state.status == CatalogStatus.error) {
                Navigator.pop(context);
                Fluttertoast.showToast(
                  msg: 'Error fetching data',
                  fontSize: 16,
                  backgroundColor: Colors.red,
                  gravity: ToastGravity.TOP,
                  textColor: Colors.white,
                );
              }
            },
            builder: (BuildContext context, state) {
              if (state.status == CatalogStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == CatalogStatus.loaded) {
                return PaginationView<MovieThumb>(
                  itemBuilder: (context, movie, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MovieThumbnail(movie: movie, index: index),
                    );
                  },
                  header: SliverPersistentHeader(
                    delegate: _Sliver(100, title),
                    pinned: true,
                  ),
                  pageFetch: (offset) => pageFetch(offset, state.movies!),
                  onEmpty: Center(
                    child: const Text('Sorry! Collection is empty'),
                  ),
                  onError: (error) => Center(
                    child: Text('Some error occured $error}'),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Future<List<MovieThumb>> pageFetch(
      int offset, List<MovieThumb> movies) async {
    var page = (offset / 20).round();
    if (movies.isNotEmpty) {
      final List<MovieThumb> nextMovieList =
          movies.sublist(page * 20, page * 20 + 20);
      await Future.delayed(Duration(seconds: 1));
      return nextMovieList;
    }
    return [];
  }
}

class _Sliver extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String title;
  _Sliver(this.expandedHeight, this.title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.clip,
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.7),
            width: double.infinity,
            child: Text(
              '$title',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
