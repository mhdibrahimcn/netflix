import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/Home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/title_and_description_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/video_widget.dart';

class NewsAndHotCard extends StatelessWidget {
  const NewsAndHotCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.14,
            height: size.height * 0.5,
            child: Column(
              children: [
                Text(
                  "FEB",
                  style: TextStyle(color: Colors.grey[300]),
                ),
                const Text(
                  "15",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 5),
                )
              ],
            ),
          ),
          SizedBox(
            width: size.width - 60,
            height: size.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(),
                kheight,
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        "The Batman",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -4),
                      ),
                    ),
                    CustomButtonWidget(
                      icon: Icons.notifications_none,
                      label: "Remind Me",
                      iconSize: 25,
                      textSize: 11,
                    ),
                    kwidth20,
                    CustomButtonWidget(
                      icon: Icons.info_outline,
                      label: "Info",
                      iconSize: 25,
                      textSize: 11,
                    ),
                    kwidth,
                  ],
                ),
                Text(
                  "Coming on Friday",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.grey[300]),
                ),
                kheight,
                TitleAndDescrptionWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
