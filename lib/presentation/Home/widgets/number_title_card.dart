import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/Home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: "Top 10 TV Shows In India"),
          kheight,
          LimitedBox(
              maxHeight: size.height * 0.24,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => NumberCard(
                        size: size,
                        index: index,
                      ),
                  separatorBuilder: (context, index) => kwidth,
                  itemCount: 10))
        ],
      ),
    );
  }
}
