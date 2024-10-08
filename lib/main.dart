import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/application/movie_info/movie_info_bloc.dart';
import 'package:netflix/application/new&hot/new_and_hot_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/domain/connectivity/connectivity_service.dart';
import 'package:netflix/domain/core/di/injectable.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ConnectivityService());
  await configureInjection(Environment.prod);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<NewAndHotBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<MovieInfoBloc>(),
        ),
      ],
      child: GetMaterialApp(
        title: "Netflix App",
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          LocaleNamesLocalizationsDelegate(),
        ],
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: backgroundColor,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.white))),
        home: ScreenMainPage(),
      ),
    );
  }
}
