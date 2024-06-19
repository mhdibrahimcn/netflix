import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.posterImage});
  final int index;
  final String posterImage;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: size.width * 0.09,
              ),
              Container(
                width: size.width * 0.34,
                height: size.height * 0.24,
                decoration: BoxDecoration(
                    borderRadius: kRadius,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(posterImage))),
              ),
            ],
          ),
          Positioned(
              top: 60,
              left: -2,
              child: BorderedText(
                strokeWidth: 4.0,
                strokeColor: Colors.white,
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      decorationColor: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
