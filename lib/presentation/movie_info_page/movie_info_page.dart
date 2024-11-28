import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:netflix/application/movie_info/movie_info_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieInfoPage extends StatelessWidget {
  final int movieId;

  const MovieInfoPage({super.key, required this.movieId});

  @override
  // Builds the UI for displaying movie information and handling video playback.
  Widget build(BuildContext context) {
    // Initialize GetX controller
    final MovieInfoController controller = Get.put(MovieInfoController());

    // Fetch movie info when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<MovieInfoBloc>(context)
          .add(MovieInfoEvent.getMovieVideoLink(movieId));
    });

    return BlocBuilder<MovieInfoBloc, MovieInfoState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!state.isError && state.youtubeVideoId.isNotEmpty) {
          return Scaffold(
            body: YoutubePlayerBuilder(
              onEnterFullScreen: () {
                SystemChrome.setEnabledSystemUIMode(
                  SystemUiMode.immersive,
                );
                // Add animation for entering full screen
                Future.delayed(const Duration(milliseconds: 300), () {
                  controller.setFullScreen(true);
                });
              },
              onExitFullScreen: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                    overlays: SystemUiOverlay.values);
                // Add animation for exiting full screen
                Future.delayed(const Duration(milliseconds: 300), () {
                  controller.setFullScreen(false);
                });
              },
              player: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: state.youtubeVideoId.first.key!,
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                    captionLanguage: 'en',
                  ),
                ),
                showVideoProgressIndicator: true,
                onReady: () {
                  controller.setShowRetryButton(false);
                },
                onEnded: (data) {
                  // Set showRetryButton to true when video ends
                  controller.setShowRetryButton(true);
                },
              ),
              builder: (context, player) {
                return Obx(() {
                  return SafeArea(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: controller.isFullScreen.value
                          ? MediaQuery.of(context).size.width
                          : MediaQuery.of(context).size.width,
                      height: controller.isFullScreen.value
                          ? MediaQuery.of(context).size.height
                          : MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: kRadius20,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                      borderRadius: kRadius20, child: player),
                                ),
                              ),
                              // Show retry button if showRetryButton is true
                              Obx(() {
                                if (controller.showRetryButton.value) {
                                  return Positioned.fill(
                                    child: Container(
                                      color: Colors.black.withOpacity(0.5),
                                      child: Center(
                                        child: IconButton(
                                          icon: const Icon(Icons.replay),
                                          onPressed: () =>
                                              BlocProvider.of<MovieInfoBloc>(
                                                      context)
                                                  .add(
                                            MovieInfoEvent.getMovieVideoLink(
                                                movieId),
                                          ),
                                          color: Colors.white,
                                          iconSize: 48.0,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                                } // Empty container if retry button should not be shown
                              }),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            'Other Movie Info Here',
                            style: TextStyle(fontSize: 18),
                          ),
                          // Add more movie information widgets here
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          );
        } else {
          return const Center(
            child: Scaffold(
                body: Text('Failed to load movie info or no video available.')),
          );
        }
      },
    );
  }
}

// GetX Controller for managing state
class MovieInfoController extends GetxController {
  // Reactive state for showing retry button
  RxBool showRetryButton = false.obs;
  RxBool isFullScreen = false.obs;

  // Function to show retry button
  void setShowRetryButton(bool value) {
    showRetryButton.value = value;
  }

  // Function to set full screen state
  void setFullScreen(bool value) {
    isFullScreen.value = value;
  }
}
