import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/movie_info/movie_info_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieInfoPage extends StatelessWidget {
  final int movieId;

  const MovieInfoPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    // Fetch movie info when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<MovieInfoBloc>(context)
          .add(MovieInfoEvent.getMovieVideoLink(movieId));
    });

    final Size size = MediaQuery.of(context).size;

    return BlocBuilder<MovieInfoBloc, MovieInfoState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.isError || state.youtubeVideoId.isEmpty) {
          return const Center(
            child: Text('Failed to load movie info or no video available.'),
          );
        } else {
          return Scaffold(
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: YoutubePlayerBuilder(
                        player: YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: state.youtubeVideoId.first.key!,
                            flags: const YoutubePlayerFlags(
                              autoPlay: true,
                              mute: false,
                              captionLanguage: 'en',
                            ),
                          ),
                          showVideoProgressIndicator: true,
                          onReady: () {
                            print('Player is ready.');
                          },
                          onEnded: (data) {
                            print('Video ended.');
                          },
                        ),
                        builder: (context, player) => player,
                      ),
                    ),
                  ),
                ),
                const Text('hvhgv')
              ],
            ),
          );
        }
      },
    );
  }
}
