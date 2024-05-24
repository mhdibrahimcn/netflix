import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        // Background with blur effect
        Positioned.fill(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: Container(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
        ),
        // AppBar contents
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: double.infinity,
          height: size.height * 0.128,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/logo/netflixLogo.png",
                    width: size.width * 0.15,
                    height: size.height * 0.09,
                  ),
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
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("TV Shows", style: khometextstyle),
                  Text("Movies", style: khometextstyle),
                  Text("Categories", style: khometextstyle),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
