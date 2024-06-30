import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widget/search_text_title_widget.dart';
import 'package:netflix/presentation/widgets/preview_card.dart';
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
                      return PreviewCard(
                        imageUrl:
                            "$imageAppendUrl${validResults[index].posterPath}",
                        movieTitle: validResults[index].title!,
                        genreIds: validResults[index].genreIds!,
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
