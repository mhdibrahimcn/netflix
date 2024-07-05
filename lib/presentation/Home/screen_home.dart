import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:netflix/application/controller/home_getx_controller.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/connectivity/connectivity_service.dart';
import 'package:netflix/presentation/Home/widgets/background_card.dart';
import 'package:netflix/presentation/Home/widgets/main_title_card.dart';
import 'package:netflix/presentation/Home/widgets/number_title_card.dart';
import 'package:netflix/presentation/widgets/bulid_no_connection_state.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final paletteController = Get.put(PaletteController());
    final connectivityService = Get.find<ConnectivityService>();

    // Initialize data loading when the screen is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.homeLatest());
    });

    // Ensure system UI settings are applied
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
    ));

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<HomeBloc>(context).add(const HomeEvent.homeLatest());
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final homeResultList = state.homeResultList;
            final releasedPastYear = state.homeLatestList;
            final trendingList = state.homeTrendingList;
            final tvShowList = state.homeTvShowList;
            final dramaList = state.homeDramaGenreList;

            return Obx(() {
              if (connectivityService.isConnected.value &&
                  (homeResultList.isEmpty || releasedPastYear.isEmpty)) {
                return buildNoConnectionState(context);
              } else {
                return Stack(
                  children: [
                    Obx(() {
                      final sideColors = paletteController.sideColors;
                      final endColor = sideColors.length > 1
                          ? sideColors[1]
                          : Colors.transparent;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        width: double.infinity,
                        decoration: BoxDecoration(color: endColor),
                      );
                    }),
                    ScrollablePositionedList.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return BackgroundCard(
                              isLoading: state.isLoading,
                              isError: state.isError,
                              homeResultList: homeResultList
                                  .map((m) => '$imageAppendUrl${m.posterPath}')
                                  .toList(),
                            );
                          case 1:
                            return MainTitleCard(
                              title: 'Released In Past Year',
                              posterMovieList: releasedPastYear
                                  .map((m) => '$imageAppendUrl${m.posterPath}')
                                  .toList(),
                              isLoading: state.isLoading,
                              movieId:
                                  releasedPastYear.map((m) => m.id).toList(),
                            );
                          case 2:
                            return MainTitleCard(
                              title: 'Trending Now',
                              posterMovieList: trendingList
                                  .map((m) => '$imageAppendUrl${m.posterPath}')
                                  .toList(),
                              isLoading: state.isLoading,
                              movieId: trendingList.map((m) => m.id).toList(),
                            );
                          case 3:
                            if (tvShowList.isNotEmpty) {
                              return NumberTitleCard(
                                posterList: tvShowList
                                    .map(
                                        (m) => '$imageAppendUrl${m.posterPath}')
                                    .toList(),
                                isLoading: state.isLoading,
                              );
                            }
                            return Container();
                          case 4:
                            return MainTitleCard(
                              title: 'Tense Drama',
                              posterMovieList: dramaList
                                  .map((m) => '$imageAppendUrl${m.posterPath}')
                                  .toList(),
                              isLoading: state.isLoading,
                              movieId: dramaList.map((m) => m.id).toList(),
                            );
                          case 5:
                            return const SizedBox(height: 60);
                          default:
                            return Container();
                        }
                      },
                    ),
                  ],
                );
              }
            });
          },
        ),
      ),
    );
  }
}
