import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/Home/widgets/background_card.dart';
import 'package:netflix/presentation/Home/widgets/home_app_bar.dart';
import 'package:netflix/presentation/Home/widgets/main_title_card.dart';
import 'package:netflix/presentation/Home/widgets/number_title_card.dart';

ValueNotifier<double> scrollOffsetNotifier = ValueNotifier<double>(0.0);
ValueNotifier<bool> scrollDirectionNotifier = ValueNotifier<bool>(false);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.homeLatest());
    });

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification &&
              notification.metrics.axis == Axis.vertical) {
            final double newScrollOffset = notification.metrics.pixels;
            scrollOffsetNotifier.value = newScrollOffset;

            final ScrollDirection direction = notification.scrollDelta! > 0
                ? ScrollDirection.forward
                : ScrollDirection.reverse;

            scrollDirectionNotifier.value =
                newScrollOffset > MediaQuery.of(context).size.height / 2 &&
                    direction == ScrollDirection.forward;
          }

          return false;
        },
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
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

                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const BackgroundCard(),
                    if (releasedPastYear.isNotEmpty)
                      MainTitleCard(
                        title: 'Released In Past Year',
                        posterMovieList: releasedPastYear,
                        isLoading: state.isLoading,
                      ),
                    if (trendingList.isNotEmpty)
                      MainTitleCard(
                        title: 'Trending Now',
                        posterMovieList: trendingList,
                        isLoading: state.isLoading,
                      ),
                    if (tvShowList.isNotEmpty)
                      NumberTitleCard(
                        posterList: tvShowList,
                        isLoading: state.isLoading,
                      ),
                    if (dramaList.isNotEmpty)
                      MainTitleCard(
                        title: 'Tense Drama',
                        posterMovieList: dramaList,
                        isLoading: state.isLoading,
                      ),
                  ],
                );
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: scrollDirectionNotifier,
              builder: (context, shouldShowAppBar, _) {
                return shouldShowAppBar
                    ? const SizedBox.shrink()
                    : const HomeAppBar();
              },
            ),
          ],
        ),
      ),
    );
  }
}
