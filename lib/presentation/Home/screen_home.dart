import 'package:flutter/material.dart';

import 'package:netflix/presentation/Home/widgets/main_title_card.dart';

import 'package:netflix/presentation/Home/widgets/number_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainTitleCard(
              size: size,
              title: 'Released In Past Year',
            ),
            MainTitleCard(
              size: size,
              title: 'Trending Now',
            ),
            NumberTitleCard(size: size),
            MainTitleCard(
              size: size,
              title: 'Tense Drama',
            ),
          ],
        ),
      ),
    );
  }
}
