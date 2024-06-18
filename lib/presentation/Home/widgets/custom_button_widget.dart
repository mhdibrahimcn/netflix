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

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow_rounded,
          size: 25,
          color: kwhite,
        ),
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(color: Colors.white, width: 2.0),
            ),
          ),
          backgroundColor:
              WidgetStateProperty.all(Colors.transparent.withOpacity(0.4)),
          overlayColor:
              WidgetStateProperty.all(Colors.transparent.withOpacity(0.9)),
        ),
        label: const Text(
          "Play",
          style: TextStyle(color: kwhite, fontWeight: FontWeight.bold),
        ));
  }
}
