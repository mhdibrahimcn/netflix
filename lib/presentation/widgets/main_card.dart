import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.size,
    required this.posterUrl,
  });

  final Size size;
  final String posterUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.34,
      height: size.height * 0.24,
      decoration: BoxDecoration(
          borderRadius: kRadius,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(posterUrl))),
    );
  }
}
