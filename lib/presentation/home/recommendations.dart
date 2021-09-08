import 'package:flutter/material.dart';
import 'package:movie_app/domain/bloc/catalog/catalog_bloc.dart';
import 'package:movie_app/presentation/utils/routing.dart';

class Recommendation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Special for you',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              children: [
                _RecommendCard(
                  textColor: Colors.black,
                  backgroundColor: Colors.green,
                  asset: 'assets/images/recommend.jpg',
                  fit: BoxFit.cover,
                  event: CatalogLoadTop250Tvs(),
                  name: 'recommendation',
                  showName: false,
                ),
                _RecommendCard(
                  textColor: Colors.black,
                  backgroundColor: Colors.deepPurpleAccent,
                  asset: 'assets/images/drama.jpg',
                  name: 'Drama',
                  event: CatalogLoadDramaMovies(),
                ),
                _RecommendCard(
                  textColor: Colors.black,
                  backgroundColor: Colors.blue,
                  asset: 'assets/images/marvel.jpg',
                  name: 'Marvel Studios',
                  fit: BoxFit.cover,
                  event: CatalogLoadTop250Tvs(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendCard extends StatelessWidget {
  final Color backgroundColor;
  final String asset;
  final String name;
  final Color textColor;
  final BoxFit fit;
  final CatalogEvent event;
  final bool showName;
  const _RecommendCard({
    Key? key,
    required this.backgroundColor,
    required this.asset,
    required this.name,
    required this.textColor,
    this.fit = BoxFit.cover,
    required this.event,
    this.showName = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: InkWell(
        onTap: () => Routing.toCatalogPage(context, title: name, event: event),
        child: Container(
          margin: const EdgeInsets.all(12),
          color: backgroundColor,
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  asset,
                  fit: fit,
                  width: double.infinity,
                ),
              ),
              if (showName)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    '$name',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
