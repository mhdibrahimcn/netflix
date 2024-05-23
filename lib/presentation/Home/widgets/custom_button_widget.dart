import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.label,
  });
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: 30,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
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
