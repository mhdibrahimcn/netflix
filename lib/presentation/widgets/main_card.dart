import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/movie_info_page/movie_info_page.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.size,
    required this.posterUrl,
    required this.movieId,
  });
  final int movieId;
  final Size size;
  final String posterUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.to(() => MovieInfoPage(
              movieId: movieId,
            ));
      },
      child: Container(
        width: size.width * 0.34,
        height: size.width * 0.2,
        decoration: BoxDecoration(
            borderRadius: kRadius,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                posterUrl,
              ),
            )),
      ),
    );
  }
}
