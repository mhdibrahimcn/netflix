import 'package:cached_network_image/cached_network_image.dart';
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
      height: size.width * 0.2,
      decoration: BoxDecoration(
        borderRadius: kRadius,
        color: posterUrl == null ? Colors.grey : null,
        image: posterUrl != null
            ? DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  posterUrl,
                ),
              )
            : null,
      ),
    );
  }
}
