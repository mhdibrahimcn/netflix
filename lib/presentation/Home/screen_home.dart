import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.homeLatest());
    });
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollDirectionNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.axis == Axis.vertical) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.forward) {
                    scrollDirectionNotifier.value = true;
                  } else if (direction == ScrollDirection.reverse) {
                    scrollDirectionNotifier.value = false;
                  }
                }
                return true;
              },
              child: Stack(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      final _releasedPastYear = state.homeLatestList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      final _trendingList = state.homeTrendingList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      final _tvShowList = state.homeTvShowList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      final _dramaList = state.homeDramaGenreList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      return ListView(
                        children: [
                          const BackgroundCard(),
                          MainTitleCard(
                            title: 'Released In Past Year',
                            posterMovieList: _releasedPastYear,
                            isLoading: state.isLoading,
                          ),
                          MainTitleCard(
                            title: 'Trending Now',
                            posterMovieList: _trendingList,
                            isLoading: state.isLoading,
                          ),
                          NumberTitleCard(
                            posterList: _tvShowList,
                            isLoading: false,
                          ),
                          MainTitleCard(
                            title: 'Tense Drama',
                            posterMovieList: _dramaList,
                            isLoading: false,
                          ),
                        ],
                      );
                    },
                  ),
                  scrollDirectionNotifier.value == true
                      ? const HomeAppBar()
                      : kheight,
                ],
              ),
            );
          }),
    );
  }
}
