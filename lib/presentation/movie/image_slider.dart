import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/model/images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

class ImageSlider extends StatelessWidget {
  final Images images;

  const ImageSlider({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black26,
        ),
        child: CarouselSlider.builder(
          itemCount: images.items.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: images.items[index].image,
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    child: SizedBox(),
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey[700]!,
                  );
                },
              ),
            );
          },
          options: CarouselOptions(
            height: 200,
            aspectRatio: 1,
          ),
        ),
      ),
    );
  }
}
