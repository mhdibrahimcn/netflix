import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:netflix/application/home/getx/home_getx_controller.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/home/models/home_model.dart';
import 'package:netflix/presentation/Home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/Home/widgets/home_app_bar.dart';
import 'package:shimmer/shimmer.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Ensure that PaletteController is registered with GetX
    final PaletteController paletteController = Get.put(PaletteController());
    final CustomCarouselController customCarouselController =
        Get.put(CustomCarouselController());

    // Move expensive operation outside build method
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.homeBg());
    });

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        // Cache frequently used values
        final bool isLoading = state.isLoading;
        final List<HomeResultData> homeResultList = state.homeResultList;
        if (isLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: size.height * 0.76,
              color: Colors.white,
            ),
          );
        } else if (homeResultList.isNotEmpty) {
          final String imagePath =
              '$imageAppendUrl${homeResultList[0].posterPath}';
          paletteController.generatePalette(imagePath);

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
                  height: size.height * 0.83,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        startColor,
                        endColor,
                      ],
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
                    carouselController:
                        customCarouselController.carouselController,
                    options: cs.CarouselOptions(
                      height: size.height * 0.7,
                      viewportFraction: 0.82,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        customCarouselController.updateIndex(index);
                        final String newImagePath =
                            '$imageAppendUrl${homeResultList[index].posterPath}';
                        paletteController.generatePalette(newImagePath);
                      },
                    ),
                    itemCount: homeResultList.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        width: size.width * 0.82,
                        height: size.height * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: kRadius15,
                          image: DecorationImage(
                            image: NetworkImage(
                                '$imageAppendUrl${homeResultList[index].posterPath}'),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.6), // Adjust opacity as needed
                              blurRadius:
                                  4, // Increase blur radius for softer shadow
                              spreadRadius:
                                  1, // Spread radius controls the size of the shadow
                              offset:
                                  const Offset(0, 0), // Offset of the shadow
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
                                      sigmaX: 2.0, sigmaY: 2.0),
                                  child: Container(
                                    height: size.height * 0.066,
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.24),
                                        borderRadius: kRadius15),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              bottom: 3,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
              const Positioned(top: 40, left: 0, right: 0, child: HomeAppBar())
            ],
          );
        }
        return Container();
      },
    );
  }
}

class CustomCarouselController extends GetxController {
  var currentIndex = 0.obs;
  final carouselController = cs.CarouselController();

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
