import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
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
            Expanded(
              child: TabBarView(children: [
                _buidComingSoon(context),
                _buildEveryoneisWatching()
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _buidComingSoon(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => const NewsAndHotCard(), itemCount: 10);
  }

  Widget _buildEveryoneisWatching() {
    return ListView.builder(
        itemBuilder: (context, index) => const EveryonesWatchingCard(),
        itemCount: 10);
  }
}
