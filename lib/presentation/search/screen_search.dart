import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/presentation/search/widget/search_idle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/search/widget/search_result_widget.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((callback) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoSearchTextField(
                controller: searchController,
                backgroundColor: Colors.grey.withOpacity(0.25),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchMovies(movieQuery: value));
                  } else {
                    BlocProvider.of<SearchBloc>(context)
                        .add(const Initialize());
                  }
                },
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  Icons.close_rounded,
                  color: Colors.grey,
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                suffixMode: OverlayVisibilityMode.editing,
                onSuffixTap: () {
                  searchController.clear();
                  BlocProvider.of<SearchBloc>(context).add(const Initialize());
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (searchController.text.isEmpty) {
                      return const SearchIdle();
                    } else {
                      return const SearchResultWidget();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
