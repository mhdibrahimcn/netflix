import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/application/home/home_getx_controller.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/home/models/home_model.dart';
import 'package:netflix/presentation/Home/widgets/custom_button_widget.dart';
import 'package:shimmer/shimmer.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Ensure that PaletteController is registered with GetX
    final PaletteController paletteController = Get.put(PaletteController());

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
          // Generate palette
          paletteController.generatePalette(imagePath);

          return Stack(
            children: [
              Obx(() {
                final List<Color> sideColors = paletteController.sideColors;
                final Color startColor =
                    sideColors.isNotEmpty ? sideColors[0] : Colors.transparent;
                final Color endColor =
                    sideColors.length > 1 ? sideColors[1] : Colors.transparent;

                return Container(
                  width: double.infinity,
                  height: size.height * 0.76,
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
                top: 70,
                bottom: 30,
                right: 25,
                left: 25,
                child: Container(
                  width: size.width * 0.87,
                  height: size.height * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: kRadius15,
                    image: DecorationImage(
                      image: NetworkImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: size.height * 0.067,
                          color: Colors.black.withOpacity(0.24),
                        ),
                      ),
                      const Positioned(
                        bottom: 5,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButtonWidget(
                              icon: Icons.add,
                              label: 'My List',
                            ),
                            Playbutton(),
                            CustomButtonWidget(
                              icon: Icons.info,
                              label: 'Info',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
