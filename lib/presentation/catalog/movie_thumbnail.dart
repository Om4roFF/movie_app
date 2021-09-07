import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/bloc/movie/movie_bloc.dart';
import 'package:movie_app/domain/model/movie_thumb.dart';
import 'package:movie_app/presentation/movie/movie_page.dart';
import 'package:shimmer/shimmer.dart';

class MovieThumbnail extends StatelessWidget {
  final MovieThumb movie;
  final int index;
  const MovieThumbnail({Key? key, required this.movie, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      color: index.isEven ? Colors.black54 : Colors.grey[3000],
      height: 300,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (BuildContext context) => MovieBloc(
                  MovieLoadingState(),
                )..add(
                    MovieLoadEvent(movie.id),
                  ),
                child: MoviePage(),
              ),
            ),
          );
        },
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: movie.image,
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  child: SizedBox(
                    width: 150,
                    height: 200,
                  ),
                  baseColor: Colors.grey,
                  highlightColor: Colors.grey[700]!,
                );
              },
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
            Positioned.fill(
              left: 180,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: '${movie.rank}. '),
                          TextSpan(
                            text: movie.title,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text('${movie.imDbRating}')
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Year: ${movie.year}'),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Votes: ${movie.imDbRatingCount}'),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('${movie.crew}'),
            ),
          ],
        ),
      ),
    );
  }
}
