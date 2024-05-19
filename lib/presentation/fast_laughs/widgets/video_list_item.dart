import 'package:flutter/material.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //left side
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    radius: 28,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off,
                          color: Colors.white,
                        )),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                            "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg"),
                      ),
                      VideoActionWidget(
                          icon: Icons.emoji_emotions_outlined, title: "LOL"),
                      VideoActionWidget(icon: Icons.add, title: "My List"),
                      VideoActionWidget(icon: Icons.send, title: "Share"),
                      VideoActionWidget(icon: Icons.play_arrow, title: "Play"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            size: 28,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
