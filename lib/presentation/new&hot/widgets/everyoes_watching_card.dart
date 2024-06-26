import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/Home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/title_and_description_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/video_widget.dart';

class EveryonesWatchingCard extends StatelessWidget {
  const EveryonesWatchingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(children: [
        TitleAndDescriptionWidget(
          title: '',
          overview: '',
        ),
        kheight,
        VideoWidget(
          backdropPath: "u",
        ),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(icon: Icons.send, label: "Share"),
            kwidth20,
            CustomButtonWidget(
              icon: Icons.add,
              label: 'My List',
              iconSize: 35,
            ),
            kwidth20,
            CustomButtonWidget(
              icon: Icons.play_arrow_sharp,
              label: 'Play',
              iconSize: 35,
            ),
            kwidth,
          ],
        ),
      ]),
    );
  }
}
