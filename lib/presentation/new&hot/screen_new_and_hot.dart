import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
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
              labelPadding: EdgeInsets.symmetric(vertical: 4),
              labelStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
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
                _buildTabBarView("Coming Soon"),
                _buildTabBarView("Everyone is watching")
              ]),
            )
          ],
        ),
      ),
    );
  }

  _buildTabBarView(String name) {
    return Center(
      child: Text(name),
    );
  }
}
