import 'dart:ui'; // Required for BackdropFilter

import 'package:flutter/material.dart';

ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final iconSize = size.width * 0.056;
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndexNotifier,
      builder: (context, selectedIndex, child) {
        return Center(
          child: Container(
            height: size.height * 0.07,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: SizedBox(
                  width: size.width * 0.73,
                  height: size.height * 0.05,
                  child: BottomNavigationBar(
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      selectedIndexNotifier.value = value;
                    },
                    backgroundColor: Colors.transparent,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: [
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Icon(
                            Icons.home,
                            size: iconSize,
                          ),
                          label: "Home"),
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Icon(
                            Icons.collections,
                            size: iconSize,
                          ),
                          label: "New & Hot,  size: 15,"),
                      BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: Icon(
                          Icons.emoji_emotions,
                          size: iconSize,
                        ),
                        label: "Fast Laughs",
                      ),
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Icon(
                            Icons.search,
                            size: iconSize,
                          ),
                          label: "Search"),
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Icon(
                            Icons.download,
                            size: iconSize,
                          ),
                          label: "Downloads"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
