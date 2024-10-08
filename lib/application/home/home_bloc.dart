import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/home/home_service.dart';
import 'package:netflix/domain/home/models/home_drama_genre_model/home_drama_genre_model.dart';
import 'package:netflix/domain/home/models/home_latest_model/home_latest_model.dart';
import 'package:netflix/domain/home/models/home_model.dart';
import 'package:netflix/domain/home/models/home_tv_shows_model/home_tv_shows_model.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeService;
  final IDownloadsRepo _downloadsService;
  HomeBloc(this._homeService, this._downloadsService)
      : super(HomeState.initial()) {
    //get home data
    on<HomeLatest>(
      //if state exists
      (event, emit) async {
        if (state.homeLatestList.isNotEmpty &
            state.homeTrendingList.isNotEmpty &
            state.homeDramaGenreList.isNotEmpty &
            state.homeTvShowList.isNotEmpty &
            state.homeResultList.isNotEmpty) {
          emit(state.copyWith(
              isLoading: false,
              homeLatestList: state.homeLatestList,
              homeTrendingList: state.homeTrendingList,
              homeTvShowList: state.homeTvShowList,
              homeDramaGenreList: state.homeDramaGenreList,
              homeResultList: state.homeResultList));
          return;
        }
        //initializing
        emit(state.copyWith(
            isLoading: true,
            isError: false,
            homeLatestList: [],
            homeTrendingList: [],
            homeDramaGenreList: [],
            homeTvShowList: []));

        //getting from api

        //home corossel images
        final result = await _homeService.homeBg();
        log(result.toString());
        emit(result.fold(
            (MainFailure failure) => state.copyWith(
                isLoading: false,
                isError: true,
                homeResultList: []), (HomeBgModel list) {
          final homeBg = list.results;
          homeBg.shuffle();
          return state.copyWith(
              isLoading: false, isError: false, homeResultList: homeBg);
        }));
        final latestResult = await _homeService.homeLatest();

        emit(latestResult.fold(
            (MainFailure failure) => state.copyWith(
                  isLoading: false,
                  isError: true,
                  homeLatestList: [],
                ), (HomeLatestModel list) {
          final latestMoviesList = list.results;
          latestMoviesList.shuffle();
          return state.copyWith(
              isLoading: false,
              isError: false,
              homeLatestList: latestMoviesList);
        }));
//trending List
        final trendingResult = await _downloadsService.getDownloadsImage();
        emit(trendingResult.fold(
            (MainFailure failure) => state.copyWith(
                  isLoading: false,
                  isError: true,
                  homeTrendingList: [],
                ), (List<Downloads> list) {
          final trendingResult = list;
          trendingResult.shuffle();
          return state.copyWith(
              isLoading: false,
              isError: false,
              homeTrendingList: trendingResult);
        }));
//tv Show Result
        final tvShowResult = await _homeService.getHomeTvShow();

        emit(tvShowResult.fold(
            (MainFailure failure) => state.copyWith(
                  isLoading: false,
                  isError: true,
                  homeTvShowList: [],
                ), (HomeTvShowsModel list) {
          return state.copyWith(
              isLoading: false, isError: false, homeTvShowList: list.results);
        }));

        //drama result
        final tvDramaGenreResult = await _homeService.getHomeDramaGenre();
        emit(tvDramaGenreResult.fold(
            (MainFailure failure) => state.copyWith(
                  isLoading: false,
                  isError: true,
                  homeDramaGenreList: [],
                ), (HomeDramaGenreModel list) {
          final dramaList = list.results;
          dramaList.shuffle();
          return state.copyWith(
              isLoading: false, isError: false, homeDramaGenreList: dramaList);
        }));
      },
    );
  }
}
