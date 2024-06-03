import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/presentation/search/widget/search_idle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/search/widget/serach_result_widget.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
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
              backgroundColor: Colors.grey.withOpacity(0.25),
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
            ),
          ),
          const Expanded(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SearchIdle() //SearchResultWidget(),
                  ))
        ],
      )),
    );
  }
}
