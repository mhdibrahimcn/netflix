import 'package:flutter/material.dart';

class TitleAndDescriptionWidget extends StatelessWidget {
  final String title, overview;
  const TitleAndDescriptionWidget({
    super.key,
    required this.title,
    required this.overview,
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
            fontSize: size.width * 0.05,
            color: Colors.grey[300],
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          overview,
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.grey[500],
              fontSize: size.width * 0.036),
        )
      ],
    );
  }
}
