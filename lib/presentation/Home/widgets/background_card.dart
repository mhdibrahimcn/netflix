import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart'; // Add this import
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/Home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.homeBg());
    });
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: size.height * 0.73,
                color: Colors.white,
              ),
            ),
          );
        } else if (state.homeResultList != null &&
            state.homeResultList.isNotEmpty) {
          return SizedBox(
            child: Stack(
              children: [
                // Background image
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 10),
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.73,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          '$imageAppendUrl${state.homeResultList[0].posterPath}',
                        ),
                      ),
                    ),
                  ),
                ),
                // Frosted glass effect at the bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: size.height * 0.075,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.2),
                        ],
                      ),
                    ),
                    child: ClipRect(
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
                // Frosted glass effect at the top
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            '$imageAppendUrl${state.homeResultList[0].posterPath}'),
                        fit: BoxFit.none,
                        alignment: const Alignment(-1, -1),
                      ),
                    ),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                ),
                // Positioned buttons
                const Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
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
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
