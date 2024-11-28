import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:netflix/application/controller/back_button_controller.dart';
import 'package:netflix/presentation/Home/screen_home.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/fast_laughs/screen_fast_laugh.dart';
import 'package:netflix/presentation/main_page/widgets/bottomnav.dart';
import 'package:netflix/presentation/new&hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaughs(),
    const ScreenSearch(),
    ScreenDownloads()
  ];

  final BackButtonController backButtonController =
      Get.put(BackButtonController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }

        bool shouldClose = backButtonController.shouldExit();
        if (shouldClose) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (BuildContext context, int index, Widget? child) {
              return pages[index];
            },
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 5, // Adjust to move it up or down as desired
            child: BottomNavigationWidget(),
          ),
        ]),
      ),
    );
  }
}
