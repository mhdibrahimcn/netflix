import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgetList = [const _SmartDownloads(), Section2(), const Section3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => const SizedBox(
          height: 19,
        ),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(
            Icons.settings,
            color: kwhite,
          ),
          kwidth,
          Text(
            "Smart Downloads",
          )
        ],
      ),
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {super.key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      required this.size});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageList,
            ),
          )),
        ),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        Text(
          "we will download a personalized selection of movies and shows for you, so there always something to watch",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade400),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(builder: (context, state) {
          return SizedBox(
            width: size.width,
            height: size.height * 0.45,
            child: state.isLoading
                ? Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: size.width,
                        height: size.height * 0.45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: size.width * 0.4,
                        backgroundColor: Colors.grey[800],
                      ),
                      DownloadImageWidget(
                        imageList:
                            '$imageAppendUrl${state.downloads![0].posterPath}',
                        margin: const EdgeInsets.only(left: 165, bottom: 15),
                        angle: 20,
                        size: Size(size.width * 0.4, size.height * 0.27),
                      ),
                      DownloadImageWidget(
                        imageList:
                            '$imageAppendUrl${state.downloads![1].posterPath}',
                        margin: const EdgeInsets.only(right: 165, bottom: 15),
                        angle: -20,
                        size: Size(size.width * 0.4, size.height * 0.27),
                      ),
                      DownloadImageWidget(
                        imageList:
                            '$imageAppendUrl${state.downloads![2].posterPath}',
                        margin: const EdgeInsets.only(right: 0, top: 10),
                        size: Size(size.width * 0.43, size.height * 0.3),
                      )
                    ],
                  ),
          );
        }),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: kButtonColorBlue,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Set Up",
                  style: TextStyle(
                      color: kButtonColorWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: kButtonColorWhite,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See What You Can Download",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
