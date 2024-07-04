import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/application/controller/home_getx_controller.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/Home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/Home/widgets/home_app_bar.dart';
import 'package:shimmer/shimmer.dart';

class BackgroundCard extends StatelessWidget {
  final List<String> homeResultList;

  final bool isLoading;
  final bool isError;
  const BackgroundCard({
    super.key,
    required this.homeResultList,
    required this.isLoading,
    required this.isError,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PaletteController paletteController = Get.put(PaletteController());
    final CustomCarouselController customCarouselController =
        Get.put(CustomCarouselController());

    if (isLoading & homeResultList.isEmpty) {
      return Column(
        children: [
          const SizedBox(height: 40),
          const HomeAppBar(),
          kheight20,
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 0.82 * size.width,
              height: 1.2 * size.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      );
    } else if (isError) {
      return const Column(
        children: [
          SizedBox(height: 40),
          HomeAppBar(),
          Center(
            child: Text("Server Error"),
          ),
        ],
      );
    } else {
      return Stack(
        children: [
          Obx(() {
            final List<Color> sideColors = paletteController.sideColors;
            final Color startColor =
                sideColors.isNotEmpty ? sideColors[0] : Colors.transparent;
            final Color endColor =
                sideColors.length > 1 ? sideColors[1] : Colors.transparent;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              width: double.infinity,
              height: 0.80 * size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [startColor, endColor],
                ),
              ),
            );
          }),
          Positioned(
            top: 160,
            bottom: 20,
            right: 0,
            left: 0,
            child: SizedBox(
              width: double.infinity,
              child: cs.CarouselSlider.builder(
                carouselController: customCarouselController.carouselController,
                options: cs.CarouselOptions(
                  height: 0.7 * size.height,
                  viewportFraction: 0.82,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 10),
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  onScrolled: (value) {
                    if (value! % 1 == 0) {
                      final String newImagePath = homeResultList[
                          customCarouselController.currentIndex.value];

                      paletteController.generatePalette(newImagePath);
                    }
                  },
                  onPageChanged: (index, reason) {
                    customCarouselController.updateIndex(index);
                  },
                ),
                itemCount: homeResultList.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    width: 0.82 * size.width,
                    height: 0.5 * size.width,
                    decoration: BoxDecoration(
                      borderRadius: kRadius15,
                      image: DecorationImage(
                        image:
                            CachedNetworkImageProvider(homeResultList[index]),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 2.0,
                                sigmaY: 2.0,
                              ),
                              child: Container(
                                height: 0.066 * size.height,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.24),
                                  borderRadius: kRadius15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 3,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButtonWidget(
                                icon: Icons.add,
                                label: 'My List',
                                iconSize: 23,
                                textSize: 13,
                              ),
                              PlayButton(),
                              CustomButtonWidget(
                                icon: Icons.info,
                                label: 'Info',
                                iconSize: 23,
                                textSize: 13,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: HomeAppBar(),
          ),
        ],
      );
    }
  }
}

class CustomCarouselController extends GetxController {
  var currentIndex = 0.obs;
  final carouselController = cs.CarouselController();

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
