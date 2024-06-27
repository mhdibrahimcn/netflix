import 'package:flutter/material.dart';

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
          _getLimitedOverview(overview, sentenceLimit),
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.grey[500],
            fontSize: size.width * 0.035,
          ),
        ),
      ],
    );
  }

  String _getLimitedOverview(String text, int limit) {
    final sentences = text.split(RegExp(r'(?<=[.!?])\s+'));
    if (sentences.length <= limit) {
      return text;
    }
    return sentences.take(limit).join(' ');
  }
}
