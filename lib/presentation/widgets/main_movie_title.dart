import 'package:flutter/material.dart';

class MainMovieTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double letterSpacing;
  const MainMovieTitle({
    super.key,
    required this.title,
    this.color = Colors.white,
    this.letterSpacing = -3,
  });

  MainMovieTitle copyWith(
      {String? newTitle, Color? newColor, double? newLetterSpacing}) {
    return MainMovieTitle(
      title: newTitle ?? title,
      color: newColor ?? color,
      letterSpacing: newLetterSpacing ?? letterSpacing,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Text(
      title,
      style: TextStyle(
        fontSize: size.width * 0.08,
        fontWeight: FontWeight.w900,
        height: size.width * 0.0027,
        letterSpacing: letterSpacing,
        color: color,
      ),
    );
  }
}
