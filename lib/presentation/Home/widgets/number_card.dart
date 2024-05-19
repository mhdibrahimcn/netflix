import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.size, required this.index});
  final int index;
  final Size size;
  @override
  Widget build(BuildContext context) {
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
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/d5NXSklXo0qyIYkgV94XAgMIckC.jpg"))),
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
                  style: TextStyle(
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
