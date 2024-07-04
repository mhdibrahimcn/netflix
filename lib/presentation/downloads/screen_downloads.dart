import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/downloads/widgets/download_image_widget.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';
import 'package:shimmer/shimmer.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgetList = [
    const _SmartDownloads(),
    const Section2(),
    const Section3()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) => _widgetList[index],
          separatorBuilder: (context, index) => const SizedBox(
            height: 19,
          ),
          itemCount: _widgetList.length,
        ),
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

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    WidgetsBinding.instance.addPostFrameCallback((_) {
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
        kheight20,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            // Debug statement to track the state changes

            if (state.isLoading) {
              return SizedBox(
                width: size.width,
                height: size.height * 0.45,
                child: Center(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[100]!,
                    child: CircleAvatar(
                      radius: size.width * 0.4,
                      backgroundColor: Colors.grey[800],
                    ),
                  ),
                ),
              );
            } else if (state.downloads.isNotEmpty) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: size.width * 0.4,
                    backgroundColor: Colors.grey[800],
                  ),
                  DownloadImageWidget(
                    imageList:
                        '$imageAppendUrl${state.downloads[0].posterPath}',
                    margin: const EdgeInsets.only(left: 165, bottom: 15),
                    angle: 20,
                    size: Size(size.width * 0.4, size.height * 0.27),
                  ),
                  DownloadImageWidget(
                    imageList:
                        '$imageAppendUrl${state.downloads[1].posterPath}',
                    margin: const EdgeInsets.only(right: 165, bottom: 15),
                    angle: -20,
                    size: Size(size.width * 0.4, size.height * 0.27),
                  ),
                  DownloadImageWidget(
                    imageList:
                        '$imageAppendUrl${state.downloads[2].posterPath}',
                    margin: const EdgeInsets.only(right: 0, top: 10),
                    size: Size(size.width * 0.43, size.height * 0.3),
                  ),
                ],
              );
            } else {
              return const Text('No Internet available.');
            }
          },
        ),
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
          onPressed: () {
            Get.snackbar(
              'Hello',
              'This is a SnackBar using GetX!',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.black,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
              mainButton: TextButton(
                onPressed: () {
                  // Code to execute when the action button is pressed
                },
                child: const Text(
                  'Undo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
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
