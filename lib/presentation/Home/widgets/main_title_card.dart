import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:shimmer/shimmer.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard(
      {super.key,
      required this.title,
      required this.posterMovieList,
      required this.isLoading,
      required this.movieId});

  final List<String> posterMovieList;
  final String title;
  final bool isLoading;
  final List<int?> movieId;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ScrollController scrollController = ScrollController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          const SizedBox(height: 10),
          LimitedBox(
            maxHeight: size.width * 0.53,
            child: isLoading
                ? _buildLoadingList(size)
                : _buildPosterList(size, scrollController),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingList(Size size) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: size.width * 0.35,
          height: size.height * 0.24,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(width: 15),
      itemCount: 5,
    );
  }

  Widget _buildPosterList(Size size, ScrollController scrollController) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: scrollController,
          builder: (context, child) {
            double offset = scrollController.offset;
            double itemPosition = index * (size.width * 0.35 + 15);
            double itemWidth = size.width * 0.35;
            double viewportCenter = offset + size.width / 2;
            double itemCenter = itemPosition + itemWidth / 2;
            double distanceFromCenter = (viewportCenter - itemCenter).abs();
            double shrinkFactor = 1.0;

            // Calculate shrink factor based on distance from center
            if (distanceFromCenter < size.width * 0.35 / 2) {
              shrinkFactor = 1.0;
            } else {
              shrinkFactor = 1.0 -
                  ((distanceFromCenter - size.width * 0.35 / 2) /
                      size.width *
                      0.35);
              if (shrinkFactor < 0.5) {
                shrinkFactor = 0.5;
              }
            }

            return Transform.scale(
              scale: shrinkFactor,
              alignment: Alignment.center,
              child: MainCard(
                size: size,
                posterUrl: posterMovieList[index],
                movieId: movieId[index]!,
              ),
            );
          },
          child: MainCard(
            size: size,
            posterUrl: posterMovieList[index],
            movieId: movieId[index]!,
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 15),
      itemCount: posterMovieList.length,
    );
  }
}
