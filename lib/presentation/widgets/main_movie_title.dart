import 'package:flutter/material.dart';

class MainMovieTitle extends StatelessWidget {
  final String title;
  final Color color;

  const MainMovieTitle({
    super.key,
    required this.title,
    this.color = Colors.white,
  });

  MainMovieTitle copyWith({String? newTitle, Color? newColor}) {
    return MainMovieTitle(
      title: newTitle ?? title,
      color: newColor ?? color,
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
        letterSpacing: -3,
        color: color,
      ),
    );
  }
}
