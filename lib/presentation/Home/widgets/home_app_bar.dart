import 'dart:ui'; // Needed for ImageFilter

import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              const SizedBox(width: 50),
              Image.asset(
                "assets/images/logo/netflixLogo.png",
                width: size.width * 0.33,
                height: size.height * 0.064,
              ),
              const Spacer(),
              kwidth,
              const CircleAvatar(
                radius: 20,
                child: Icon(Icons.person),
              ),
              kwidth
            ],
          ),
          kheight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildRoundedButton(context, "TV Shows"),
              _buildRoundedButton(context, "Movies"),
              _buildRoundedButton(context, "Categories"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoundedButton(BuildContext context, String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            text,
            style: khometextstyle.copyWith(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
