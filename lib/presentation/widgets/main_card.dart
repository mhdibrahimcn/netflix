import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.34,
      height: size.height * 0.24,
      decoration: BoxDecoration(
          borderRadius: kRadius,
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/d5NXSklXo0qyIYkgV94XAgMIckC.jpg"))),
    );
  }
}
