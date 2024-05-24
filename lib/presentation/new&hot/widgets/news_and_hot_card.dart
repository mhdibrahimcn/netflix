import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/Home/widgets/custom_button_widget.dart';

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
                Container(
                  width: size.width,
                  height: size.height * 0.23,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/IYUD7rAIXzBM91TT3Z5fILUS7n.jpg"))),
                ),
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
                Text(
                  "The Batman",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.grey[400]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
