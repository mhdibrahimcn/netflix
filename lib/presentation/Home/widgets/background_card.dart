import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
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
    final PaletteController paletteController = Get.put(PaletteController());
    final CustomCarouselController customCarouselController =
        Get.put(CustomCarouselController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.homeBg());
    });

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bool isLoading = state.isLoading;
        final List<HomeResultData> homeResultList = state.homeResultList;

        if (isLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey,
            child: SizedBox(
              width: double.infinity,
              height: 0.76 * size.height,
            ),
          );
        } else if (homeResultList.isNotEmpty) {
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
                      height: 0.7 * size.height,
                      viewportFraction: 0.82,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 10),
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      onScrolled: (value) {
                        if (value! % 1 == 0) {
                          final String newImagePath =
                              '$imageAppendUrl${homeResultList[customCarouselController.currentIndex.value].posterPath}';

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
                        height: 0.5 * size.height,
                        decoration: BoxDecoration(
                          borderRadius: kRadius15,
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                '$imageAppendUrl${homeResultList[index].posterPath}'),
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
