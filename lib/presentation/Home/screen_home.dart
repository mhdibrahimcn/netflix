import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/Home/widgets/background_card.dart';
import 'package:netflix/presentation/Home/widgets/home_app_bar.dart';
import 'package:netflix/presentation/Home/widgets/main_title_card.dart';
import 'package:netflix/presentation/Home/widgets/number_title_card.dart';

ValueNotifier<bool> scrollDirectionNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollDirectionNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.forward) {
                  scrollDirectionNotifier.value = true;
                } else if (direction == ScrollDirection.reverse) {
                  scrollDirectionNotifier.value = false;
                }

                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      BackgroundCard(size: size),
                      const MainTitleCard(
                        title: 'Released In Past Year',
                      ),
                      const MainTitleCard(
                        title: 'Trending Now',
                      ),
                      NumberTitleCard(size: size),
                      const MainTitleCard(
                        title: 'Tense Drama',
                      ),
                    ],
                  ),
                  scrollDirectionNotifier.value == true ? HomeAppBar() : kheight
                ],
              ),
            );
          }),
    );
  }
}
