import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

Column buildNoConnectionState(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
          child: Image.asset(
        'assets/gif/no_internet.gif',
        width: 300,
        height: 300,
      )),
      MaterialButton(
        onPressed: () {
          BlocProvider.of<HomeBloc>(context).add(const HomeEvent.homeLatest());
        },
        shape: RoundedRectangleBorder(borderRadius: kRadius15),
        color: kButtonColorWhite,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Retry",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
