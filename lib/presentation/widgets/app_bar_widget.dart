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
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 25,
        ),
        kwidth,
        CircleAvatar(
          radius: 20,
          child: Icon(Icons.person),
        ),
        kwidth
      ],
    );
  }
}
