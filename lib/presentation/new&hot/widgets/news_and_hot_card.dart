import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/application/new&hot/controlller/palette_new_and_hot_contoller.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/Home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/title_and_description_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/video_widget.dart';
import 'package:netflix/presentation/widgets/main_movie_title.dart';

class NewsAndHotCard extends StatelessWidget {
  final String month, day, backdropPath, title, overview, dayName;

  const NewsAndHotCard({
    super.key,
    required this.month,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.day,
    required this.dayName,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PaletteControllerHotAndNew paletteController =
        Get.put(PaletteControllerHotAndNew());
    paletteController.generatePalette('$imageAppendUrl$backdropPath');

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
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
            Row(children: [
              SizedBox(
                width: size.width * 0.12,
                height: size.height * 0.5,
                child: Column(
                  children: [
                    Text(
                      month,
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                    Text(
                      day,
                      style: TextStyle(
                          fontSize: size.width * 0.07,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 4),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: size.width - 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kheight20,
                    VideoWidget(
                      backdropPath: '$imageAppendUrl$backdropPath',
                    ),
                    kheight,
                    Row(
                      children: [
                        Expanded(
                          child: MainMovieTitle(
                            title: title,
                          ),
                        ),
                        const CustomButtonWidget(
                          icon: Icons.notifications_none,
                          label: "Remind Me",
                          iconSize: 25,
                          textSize: 11,
                        ),
                        kwidth20,
                        const CustomButtonWidget(
                          icon: Icons.info_outline,
                          label: "Info",
                          iconSize: 25,
                          textSize: 11,
                        ),
                        kwidth,
                      ],
                    ),
                    Text(
                      "Coming on $dayName",
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.grey[300]),
                    ),
                    kheight,
                    TitleAndDescriptionWidget(
                      title: title,
                      overview: overview,
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ));
  }
}
