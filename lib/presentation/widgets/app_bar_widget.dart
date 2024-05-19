import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 25,
        ),
        kwidth,
        Container(
          width: 25,
          height: 25,
          color: Colors.blue,
        ),
        kwidth
      ],
    );
  }
}