import 'dart:ui'; // Required for BackdropFilter

import 'package:flutter/material.dart';

ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                  width: size.width * 0.8,
                  height: size.height * 0.07,
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
                    selectedIconTheme: const IconThemeData(color: Colors.white),
                    unselectedIconTheme:
                        const IconThemeData(color: Colors.grey),
                    items: const [
                      BottomNavigationBarItem(
                          backgroundColor: Colors.transparent,
                          icon: Icon(
                            Icons.home,
                            size: 20,
                          ),
                          label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.collections,
                            size: 20,
                          ),
                          label: "New & Hot,  size: 15,"),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.emoji_emotions,
                          size: 20,
                        ),
                        label: "Fast Laughs",
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.search,
                            size: 20,
                          ),
                          label: "Search"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.download,
                            size: 20,
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
