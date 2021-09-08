import 'package:flutter/material.dart';
import 'package:movie_app/domain/bloc/catalog/catalog_bloc.dart';
import 'package:movie_app/presentation/utils/routing.dart';

class Collections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Collections',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.white,
                ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: [
              _MaCard(
                textColor: Colors.black,
                asset: 'assets/images/top250Imdb.jpg',
                backgroundColor: Colors.yellow,
                nameOfCard: 'Top 250 IMDb',
                event: CatalogLoadTop250ImDb(),
              ),
              _MaCard(
                textColor: Colors.black,
                asset: 'assets/images/top250Tvs.jpg',
                backgroundColor: Colors.grey,
                nameOfCard: 'Top 250 TV shows',
                event: CatalogLoadTop250Tvs(),
              ),
              _MaCard(
                textColor: Colors.black,
                asset: 'assets/images/boxOffice.jpg',
                backgroundColor: Colors.red,
                nameOfCard: 'Box Office All Time',
                event: CatalogLoadTop250ImDb(),
              ),
              _MaCard(
                textColor: Colors.black,
                asset: 'assets/images/most_popular.jpg',
                backgroundColor: Colors.white,
                nameOfCard: 'Most popular movies',
                event: CatalogLoadMostPopularMovies(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MaCard extends StatelessWidget {
  final Color backgroundColor;
  final String asset;
  final String nameOfCard;
  final Color textColor;
  final CatalogEvent event;
  const _MaCard(
      {Key? key,
      required this.backgroundColor,
      required this.asset,
      required this.nameOfCard,
      required this.textColor,
      required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Routing.toCatalogPage(context, title: nameOfCard, event: event),
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              child: ClipRRect(
                child: Image.asset(
                  asset,
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  '$nameOfCard',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
