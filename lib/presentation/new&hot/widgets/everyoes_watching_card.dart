import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/application/new&hot/controlller/palette_new_and_hot_contoller.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/Home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/title_and_description_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/video_widget.dart';

class EveryonesWatchingCard extends StatelessWidget {
  final String backdropPath, title, overview;
  const EveryonesWatchingCard({
    super.key,
    required this.backdropPath,
    required this.title,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PaletteControllerHotAndNew paletteController =
        Get.put(PaletteControllerHotAndNew());
    paletteController.generatePalette('$imageAppendUrl$backdropPath');

    final textSize = size.width * 0.03;
    final iconSize = size.width * 0.07;
    return Stack(
      children: [
        Obx(() {
          final sideColors =
              paletteController.getPalette('$imageAppendUrl$backdropPath');
          if (sideColors.isEmpty) {
            return Container(
              height: size.height * 0.3,
              color: Colors.black, // Default color when sideColors is empty
            );
          }
          return Container(
            height: size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: kRadius20,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  sideColors[1], // Bottom color from image
                  Colors.black
                ],
                stops: const [0.0, 1],
              ),
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            kheight,
            VideoWidget(
              backdropPath: '$imageAppendUrl$backdropPath',
            ),
            kheight,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.w900,
                        height: size.width * 0.0027,
                        letterSpacing: -3),
                  ),
                ),
                kwidth,
                CustomButtonWidget(
                  icon: CupertinoIcons.share,
                  label: "Share",
                  iconSize: iconSize,
                  textSize: textSize,
                ),
                kwidth,
                CustomButtonWidget(
                  icon: Icons.add,
                  label: 'My List',
                  iconSize: iconSize,
                  textSize: textSize,
                ),
                kwidth,
                CustomButtonWidget(
                  icon: Icons.play_arrow_sharp,
                  label: 'Play',
                  iconSize: iconSize,
                  textSize: textSize,
                ),
                kwidth,
              ],
            ),
            TitleAndDescriptionWidget(
              title: '',
              overview: overview,
            ),
          ]),
        ),
      ],
    );
  }
}
