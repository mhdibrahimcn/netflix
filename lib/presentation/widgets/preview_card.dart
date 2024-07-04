import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/methods.dart';
import 'package:netflix/presentation/widgets/main_movie_title.dart';

class PreviewCard extends StatelessWidget {
  final String imageUrl;
  final String movieTitle;
  final List<int> genreIds;
  final String overview;
  final double rating;
  final String language;

  const PreviewCard(
      {super.key,
      required this.imageUrl,
      required this.movieTitle,
      required this.genreIds,
      required this.overview,
      required this.rating,
      required this.language});

  @override
  Widget build(BuildContext context) {
    OverlayEntry? overlayEntry;
    List<String> genres = genreIds
        .map((id) => genreMap[id] ?? 'Unknown')
        .toList(); // Use genreMap correctly
    final Size size = MediaQuery.of(context).size;
    final languageName = LocaleNames.of(context)?.nameOf(language) ?? 'Unknown';
    void showOverlay(BuildContext context) {
      overlayEntry = OverlayEntry(
        builder: (context) {
          return Stack(
            children: [
              // The blur background
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  color: Colors.black.withOpacity(0.54),
                ),
              ),
              // The centered image and title with animation
              Positioned(
                top: MediaQuery.of(context).size.height * 0.094,
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
                  child: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  "Lang : $languageName",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey[400],
                                    fontSize: size.width * 0.044,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    rating == 0
                                        ? ""
                                        : "${rating.toStringAsFixed(1)} ⭐️",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey[400],
                                      fontSize: size.width * 0.044,
                                    ),
                                  ),
                                  kwidth20
                                ],
                              ),
                            ],
                          ),
                        ),
                        // The title

                        Material(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: MainMovieTitle(
                              title: movieTitle,
                            ).copyWith(
                              newFontSize: 0.0033,
                              newColor: Colors.white70,
                              newLetterSpacing: 0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
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
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    offset: const Offset(4, 4),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.1),
                                    offset: const Offset(-4, -4),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              width: size.width * 0.6,
                              height: size.width * 0.9,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.043,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 5.0,
                            runSpacing: -7,
                            children: genres
                                .take(3)
                                .map((genre) => Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        genre,
                                        style: TextStyle(
                                            fontFamily: 'San Francisco',
                                            fontSize: size.width * 0.044,
                                            color: Colors.white60,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        kheight,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              getLimitedOverview(overview, 2),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.grey[500],
                                fontSize: size.width * 0.035,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );

      Overlay.of(context).insert(overlayEntry!);
    }

    void removeOverlay() {
      if (overlayEntry != null) {
        overlayEntry!.remove();
        overlayEntry = null;
      }
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
