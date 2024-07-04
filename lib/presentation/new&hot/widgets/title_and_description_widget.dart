import 'package:flutter/material.dart';
import 'package:netflix/core/methods.dart';

class TitleAndDescriptionWidget extends StatelessWidget {
  final String title, overview;
  final int sentenceLimit;

  const TitleAndDescriptionWidget({
    super.key,
    required this.title,
    required this.overview,
    this.sentenceLimit = 3, // default limit to 2 sentences
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: size.width * 0.046,
            color: Colors.grey[300],
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          getLimitedOverview(overview, sentenceLimit),
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.grey[500],
            fontSize: size.width * 0.035,
          ),
        ),
      ],
    );
  }
}
