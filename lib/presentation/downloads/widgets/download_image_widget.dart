import 'dart:math';

import 'package:flutter/material.dart';

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {super.key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      required this.size});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageList,
            ),
          )),
        ),
      ),
    );
  }
}
