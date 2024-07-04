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
    bool flag = false;
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
        body: RefreshIndicator(onRefresh: () async {
          BlocProvider.of<HomeBloc>(context).add(const HomeEvent.homeLatest());
        }, child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          // Cache frequently used values

          final homeResultList = state.homeResultList
              .map((m) => '$imageAppendUrl${m.posterPath}')
              .toList();
          final releasedPastYear = state.homeLatestList
              .map((m) => '$imageAppendUrl${m.posterPath}')
              .toList();
          final trendingList = state.homeTrendingList
              .map((m) => '$imageAppendUrl${m.posterPath}')
              .toList();
          final tvShowList = state.homeTvShowList
              .map((m) => '$imageAppendUrl${m.posterPath}')
              .toList();
          final dramaList = state.homeDramaGenreList
              .map((m) => '$imageAppendUrl${m.posterPath}')
              .toList();

          return Obx(() {
            // Check connectivity status and show appropriate UI
            if (connectivityService.isConnected.value &
                (homeResultList.isEmpty || releasedPastYear.isEmpty)) {
              flag = true;
              return buildNoConnectionState(context);
            } else {
              if (flag) {
                BlocProvider.of<HomeBloc>(context)
                    .add(const HomeEvent.homeLatest());
                flag = false;
              }
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
                    itemCount:
                        6, // Adjust according to the number of items in the list
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return BackgroundCard(
                            isLoading: state.isLoading,
                            isError: state.isError,
                            homeResultList: homeResultList,
                          );
                        case 1:
                          return MainTitleCard(
                            title: 'Released In Past Year',
                            posterMovieList: releasedPastYear,
                            isLoading: state.isLoading,
                          );
                        case 2:
                          return MainTitleCard(
                            title: 'Trending Now',
                            posterMovieList: trendingList,
                            isLoading: state.isLoading,
                          );
                        case 3:
                          if (tvShowList.isNotEmpty) {
                            return NumberTitleCard(
                              posterList: tvShowList,
                              isLoading: state.isLoading,
                            );
                          }
                          return Container();
                        case 4:
                          return MainTitleCard(
                            title: 'Tense Drama',
                            posterMovieList: dramaList,
                            isLoading: state.isLoading,
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
        })));
  }
}
