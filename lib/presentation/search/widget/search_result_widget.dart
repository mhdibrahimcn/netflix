import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widget/search_text_title_widget.dart';
import 'package:netflix/presentation/widgets/main_movie_title.dart';
import 'package:shimmer/shimmer.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Movies & TV"),
        kheight20,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  shrinkWrap: true,
                  children: List.generate(9, (index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[700]!,
                      highlightColor: Colors.grey[200]!,
                      direction: ShimmerDirection.btt,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  }),
                );
              } else {
                final validResults = state.searchResultList
                    .where((result) => result.posterPath != null)
                    .toList();
                if (validResults.isNotEmpty) {
                  return GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1.7,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    shrinkWrap: true,
                    children: List.generate(validResults.length, (index) {
                      return MainCardSearch(
                        imageUrl:
                            "$imageAppendUrl${validResults[index].posterPath}",
                        movieTitle: validResults[index].title!,
                      );
                    }),
                  );
                } else {
                  return const Center(child: Text("No Movies found"));
                }
              }
            },
          ),
        ),
      ],
    );
  }
}

class MainCardSearch extends StatelessWidget {
  final String imageUrl;
  final String movieTitle;

  const MainCardSearch({
    super.key,
    required this.imageUrl,
    required this.movieTitle,
  });

  @override
  Widget build(BuildContext context) {
    OverlayEntry? overlayEntry;

    void showOverlay(BuildContext context) {
      overlayEntry = OverlayEntry(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              overlayEntry?.remove();
              overlayEntry = null;
            },
            child: Stack(
              children: [
                // The blur background
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                // The centered image and title with animation
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.16,
                  left: 0,
                  right: 0,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 120),
                    curve: Curves.fastOutSlowIn,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // The title
                        Material(
                          color: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: MainMovieTitle(
                              title: movieTitle,
                            ).copyWith(newColor: Colors.white70),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.069,
                        ),
                        // The image
                        Center(
                          child: Transform.scale(
                            scale: 1.2,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(imageUrl),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.width * 0.9,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );

      Overlay.of(context).insert(overlayEntry!);
    }

    void removeOverlay() {
      overlayEntry?.remove();
      overlayEntry = null;
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPressStart: (_) {
        showOverlay(context);
      },
      onLongPressEnd: (_) {
        removeOverlay();
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
