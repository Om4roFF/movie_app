import 'package:flutter/material.dart';

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
                ),
                _RecommendCard(
                  textColor: Colors.black,
                  backgroundColor: Colors.deepPurpleAccent,
                  asset: 'assets/images/drama.jpg',
                  name: 'Drama',
                ),
                _RecommendCard(
                  textColor: Colors.black,
                  backgroundColor: Colors.blue,
                  asset: 'assets/images/marvel.jpg',
                  name: 'Marvel Studios',
                  fit: BoxFit.cover,
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
  final String? name;
  final Color textColor;
  final BoxFit fit;

  const _RecommendCard(
      {Key? key,
      required this.backgroundColor,
      required this.asset,
      this.name,
      required this.textColor,
      this.fit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: InkWell(
        onTap: null,
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
              if (name != null)
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
