import 'package:flutter/material.dart';
import 'package:movie_app/domain/model/ratings.dart';

class Rating extends StatelessWidget {
  final Ratings ratings;
  final String votes;
  const Rating({Key? key, required this.ratings, required this.votes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 20,
            ),
            child: Text(
              'IMDb Rating',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Card(
            color: Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    '${ratings.imDb}/10',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.green,
                        ),
                  ),
                  Text(
                    'Votes: $votes',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Card(
                  color: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(left: 20, right: 10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${ratings.metacritic}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.green),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Metascore',
                            style: Theme.of(context).textTheme.headline6!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(right: 20, left: 10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: ratings.rottenTomatoes != ''
                        ? Column(
                            children: [
                              Text(
                                'Rotten Tomatoes',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(),
                              ),
                              Text(
                                '${ratings.rottenTomatoes}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.green),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Text(
                                'TVcom',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(),
                              ),
                              Text(
                                ratings.tVCom ?? 'Unknown',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.green),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
