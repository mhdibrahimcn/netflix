import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/new&hot/new_and_hot_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new&hot/widgets/everyoes_watching_card.dart';
import 'package:netflix/presentation/new&hot/widgets/news_and_hot_card.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: "New & Hot"),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              unselectedLabelColor: kwhite,
              labelColor: kblackColor,
              labelPadding: const EdgeInsets.symmetric(vertical: 4),
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
              indicator: BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.circular(
                    30), // Adjust the value for desired roundness
              ),
              indicatorPadding:
                  const EdgeInsets.symmetric(horizontal: -20.0, vertical: 4),
              tabs: const [
                Tab(
                  text: "🍿 Coming Soon",
                ),
                Tab(
                  text: "👀 Everyone's Watching",
                ),
              ],
            ),
            kheight,
            Expanded(
              child: TabBarView(children: [
                _buidComingSoon(context),
                _buildEveryoneisWatching(context)
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _buidComingSoon(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context).add(
        const NewAndHotEvent.getUpcomingMovieData(),
      );
    });

    return BlocBuilder<NewAndHotBloc, NewAndHotState>(
      builder: (context, state) {
        if (state.isLoading) {
          log("is loading");
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.upcomingMovieList.isNotEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.upcomingMovieList.length,
            itemBuilder: (context, index) {
              final upcomingMovie = state.upcomingMovieList[index];

              // Parse and format release date
              DateTime releaseDate = DateTime.parse(upcomingMovie.releaseDate!);
              String monthAbbreviation = DateFormat('MMM')
                  .format(releaseDate); // Get month abbreviation (e.g., Feb)
              String dayOfMonth = DateFormat('dd')
                  .format(releaseDate); // Get day of month (e.g., 12)
              String dayName = DateFormat.EEEE()
                  .format(releaseDate); // Get full day name (e.g., Monday)

              return NewsAndHotCard(
                month: monthAbbreviation,
                day: dayOfMonth,
                backdropPath: upcomingMovie.backdropPath!,
                title: upcomingMovie.title!,
                overview: upcomingMovie.overview!,
                dayName: dayName,
              );
            },
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Failed to load data'),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildEveryoneisWatching(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context).add(
        const NewAndHotEvent.getEveryoneWatchingMovieData(),
      );
    });

    return BlocBuilder<NewAndHotBloc, NewAndHotState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.everyoneWatchingList.isNotEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.everyoneWatchingList.length,
            itemBuilder: (context, index) {
              final everyoneWatchingList = state.everyoneWatchingList[index];

              return EveryonesWatchingCard(
                backdropPath: everyoneWatchingList.backdropPath!,
                title: everyoneWatchingList.name!,
                overview: everyoneWatchingList.overview!,
              );
            },
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Failed to load data'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
