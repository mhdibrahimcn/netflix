import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/main_movie_title.dart';

class PreviewCard extends StatelessWidget {
  final String imageUrl;
  final String movieTitle;
  final List<int> genreIds;

  const PreviewCard({
    super.key,
    required this.imageUrl,
    required this.movieTitle,
    required this.genreIds,
  });

  @override
  Widget build(BuildContext context) {
    OverlayEntry? overlayEntry;
    List<String> genres = genreIds
        .map((id) => genreMap[id] ?? 'Unknown')
        .toList(); // Use genreMap correctly

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
                  top: MediaQuery.of(context).size.height * 0.18,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MainMovieTitle(
                                title: movieTitle,
                              ).copyWith(
                                  newColor: Colors.white70,
                                  newLetterSpacing: 0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
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
                                borderRadius: kRadius15,
                              ),
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.width * 0.9,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 8.0,
                              runSpacing: -2,
                              children: genres
                                  .map((genre) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          genre,
                                          style: const TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ))
                                  .toList(),
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
        FocusManager.instance.primaryFocus?.unfocus();
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
