import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widget/search_text_title_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: "Top Searches",
        ),
        kheight,
        Expanded(
          child:
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.isError) {
              return const Text("Error occurred from server");
            } else if (state.idleList == []) {
              return const Text("The List is empty");
            } else {
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                   
                    return TopSearchItemTile(
                        title: movie.title ?? "No title  Provide",
                        imageUrl: '$imageAppendUrl${movie.backdropPath}' ??
                            "No movie poster provided");
                  },
                  separatorBuilder: (context, index) => kheight20,
                  itemCount: state.idleList.length);
            }
          }),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title, imageUrl;
  const TopSearchItemTile(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: screenHeight * 0.1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        kwidth,
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        )),
        const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
