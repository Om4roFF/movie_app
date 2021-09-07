import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/bloc/catalog/catalog_bloc.dart';
import 'package:movie_app/presentation/catalog/catalog.dart';
import 'package:movie_app/presentation/home/recommendations.dart';

import 'collections.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Recommendation(),
            Collections(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (index) {},
      //   items: [
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.home_filled),
      //       label: 'Home',
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'Favorite Movies',
      //     ),
      //   ],
      // ),
    );
  }
}
