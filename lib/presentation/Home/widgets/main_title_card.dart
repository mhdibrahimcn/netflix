import 'package:flutter/material.dart';

import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

import 'package:shimmer/shimmer.dart'; // Import the shimmer package

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
    required this.posterMovieList,
    required this.isLoading,
  });

  final List posterMovieList;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Get the current date and format it

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          kheight,
          LimitedBox(
            maxHeight: size.height * 0.24,
            child: isLoading
                ? ListView.separated(
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
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    separatorBuilder: (context, index) => kwidth15,
                    itemCount: 5,
                  )
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // Append the current date to the poster URL
                      final String posterUrl = posterMovieList[index];

                      return MainCard(
                        size: size,
                        posterUrl: posterUrl,
                      );
                    },
                    separatorBuilder: (context, index) => kwidth15,
                    itemCount: posterMovieList.length,
                  ),
          ),
        ],
      ),
    );
  }
}
