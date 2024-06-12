import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/Home/widgets/background_card.dart';
import 'package:netflix/presentation/Home/widgets/main_title_card.dart';
import 'package:netflix/presentation/Home/widgets/number_title_card.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.homeLatest());
    });
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          // Cache frequently used values
          final List<String> releasedPastYear = state.homeLatestList
              .map((m) => '$imageAppendUrl${m.posterPath}')
              .toList();
          final List<String> trendingList = state.homeTrendingList
              .map((m) => '$imageAppendUrl${m.posterPath}')
              .toList();
          final List<String> tvShowList = state.homeTvShowList
              .map((m) => '$imageAppendUrl${m.posterPath}')
              .toList();
          final List<String> dramaList = state.homeDramaGenreList
              .map((m) => '$imageAppendUrl${m.posterPath}')
              .toList();

          return ScrollablePositionedList.builder(
            itemCount: 5, // Adjust according to the number of items in the list
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const BackgroundCard();
                case 1:
                  if (releasedPastYear.isNotEmpty) {
                    return MainTitleCard(
                      title: 'Released In Past Year',
                      posterMovieList: releasedPastYear,
                      isLoading: state.isLoading,
                    );
                  }
                  return Container();
                case 2:
                  if (trendingList.isNotEmpty) {
                    return MainTitleCard(
                      title: 'Trending Now',
                      posterMovieList: trendingList,
                      isLoading: state.isLoading,
                    );
                  }
                  return Container();
                case 3:
                  if (tvShowList.isNotEmpty) {
                    return NumberTitleCard(
                      posterList: tvShowList,
                      isLoading: state.isLoading,
                    );
                  }
                  return Container();
                case 4:
                  if (dramaList.isNotEmpty) {
                    return MainTitleCard(
                      title: 'Tense Drama',
                      posterMovieList: dramaList,
                      isLoading: state.isLoading,
                    );
                  }
                  return Container();
                default:
                  return Container();
              }
            },
          );
        },
      ),
    );
  }
}
