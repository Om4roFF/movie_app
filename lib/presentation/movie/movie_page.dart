import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/bloc/movie/movie_bloc.dart';
import 'package:movie_app/presentation/movie/content.dart';
import 'package:movie_app/presentation/movie/image_slider.dart';
import 'package:movie_app/presentation/movie/sliver_app_bar.dart';
import 'package:movie_app/presentation/movie/trailer_view.dart';

import 'movie_rating.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoadingState) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is MovieLoadedState) {
          final movie = state.movie;
          return Scaffold(
            backgroundColor: const Color.fromRGBO(0, 17, 26, 1),
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: MySliverAppBar(
                    expandedHeight: 350,
                    imageUrl: movie.image,
                    title: movie.fullTitle,
                  ),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Content(movie: movie),
                        ImageSlider(images: movie.images),
                        if (state.trailer != null)
                          TrailerView(trailer: state.trailer!),
                        Rating(
                          ratings: movie.ratings,
                          votes: movie.imDbRatingVotes,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
