import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.label,
    this.iconSize = 30,
    this.textSize = 13,
  });
  final IconData icon;
  final String label;
  final double iconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: iconSize,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize),
        )
      ],
    );
  }
}

class Playbutton extends StatelessWidget {
  const Playbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow_rounded,
          size: 30,
          color: kwhite,
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.white, width: 2.0),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(Colors.transparent.withOpacity(0.4)),
          overlayColor:
              MaterialStateProperty.all(Colors.transparent.withOpacity(0.9)),
        ),
        label: const Text(
          "Play",
          style: TextStyle(color: kwhite, fontWeight: FontWeight.bold),
        ));
  }
}
