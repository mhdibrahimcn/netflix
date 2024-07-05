import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/movie_info/movie_info_bloc.dart';
import 'package:netflix/core/constants.dart';

class MovieInfoPage extends StatelessWidget {
  final int movieId;

  const MovieInfoPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    // Fetch movie info when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<MovieInfoBloc>(context)
          .add(MovieInfoEvent.getMovieInfo(movieId));
    });

    return BlocBuilder<MovieInfoBloc, MovieInfoState>(
      builder: (context, state) {
        // Checking for different states of the bloc
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Failed to load movie info'),
          );
        } else {
          // Ensure state.movieInfo and its properties are not null
          if (state.movieInfo != null && state.movieInfo!.posterPath != null) {
            return Scaffold(
              body: Column(
                children: [
                  Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            '$imageAppendUrl${state.movieInfo!.backdropPath!}',
                          ),
                          fit: BoxFit
                              .cover, // Adjust as per your UI requirements
                        ),
                      ),
                    ),
                  ),
                  // Add more widgets here based on your UI design
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('No poster available'),
            );
          }
        }
      },
    );
  }
}
