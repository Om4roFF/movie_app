import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/model/movie.dart';

class Content extends StatelessWidget {
  final Movie movie;

  const Content({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              movie.fullTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(movie.year),
                    if (movie.genres != null)
                      Text(
                        ', ${movie.genres!}',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(movie.countries),
                    Text(', '),
                    Text(movie.runtimeStr),
                  ],
                ),
                Text(
                  '${movie.directors}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Stars: ${movie.stars}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Companies: ${movie.companies}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          if (movie.awards != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Awards: ${movie.awards}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          if (movie.boxOffice != null)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(98, 98, 135, 1),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: []),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Box Office',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Budjet: ${movie.boxOffice!.budget}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Box Office Worldwide: ${movie.boxOffice!.cumulativeWorldwideGross}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Box Office receipts in the USA: ${movie.boxOffice!.grossUsa}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
          _Description(
            plot: movie.plot,
          ),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final String plot;

  const _Description({Key? key, required this.plot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
            tapBodyToExpand: true,
            hasIcon: false,
          ),
          expanded: Text(
            plot,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontStyle: FontStyle.italic),
          ),
          collapsed: Text(
            plot,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontStyle: FontStyle.italic),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          header: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Description',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
