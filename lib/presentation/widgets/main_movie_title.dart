import 'package:flutter/material.dart';

class MainMovieTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double letterSpacing;
  final double fontSize;
  const MainMovieTitle({
    super.key,
    required this.title,
    this.color = Colors.white,
    this.letterSpacing = -3,
    this.fontSize = 0.0027,
  });

  MainMovieTitle copyWith(
      {String? newTitle,
      Color? newColor,
      double? newLetterSpacing,
      double? newFontSize}) {
    return MainMovieTitle(
      title: newTitle ?? title,
      color: newColor ?? color,
      letterSpacing: newLetterSpacing ?? letterSpacing,
      fontSize: newFontSize ?? fontSize,
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
        height: size.width * fontSize,
        letterSpacing: letterSpacing,
        color: color,
      ),
    );
  }
}
