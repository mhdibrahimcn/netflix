import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/Home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:shimmer/shimmer.dart'; // Add the shimmer package

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.posterList,
    required this.isLoading,
  });

  final List posterList;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitle(title: "Top 10 TV Shows"),
          kheight,
          LimitedBox(
            maxHeight: size.height * 0.24,
            child: isLoading
                ? ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.24,
                        color: Colors.white,
                      ),
                    ),
                    separatorBuilder: (context, index) => kwidth,
                    itemCount: 10,
                  )
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return NumberCard(
                        index: index,
                        posterImage: posterList[index],
                      );
                    },
                    separatorBuilder: (context, index) => kwidth,
                    itemCount: 10,
                  ),
          ),
        ],
      ),
    );
  }
}
