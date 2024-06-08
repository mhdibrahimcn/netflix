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

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeService;
  final IDownloadsRepo _downloadsService;
  HomeBloc(this._homeService, this._downloadsService)
      : super(HomeState.initial()) {
    on<HomeBg>((event, emit) async {
      //if home bg poster result is exists
      if (state.homeResultList.isNotEmpty) {
        emit(state.copyWith(
            isLoading: false,
            isError: false,
            homeResultList: state.homeResultList));
        return;
      }
      //initializing
      emit(state.copyWith(isLoading: true, isError: false, homeResultList: []));

      //getting from api
      final result = await _homeService.homeBg();
      log(result.toString());
      emit(result.fold(
          (MainFailure failure) => state.copyWith(
              isLoading: false,
              isError: true,
              homeResultList: []), (HomeBgModel list) {
        final _homeBg = list.results;
        _homeBg.shuffle();
        return state.copyWith(
            isLoading: false, isError: true, homeResultList: _homeBg);
      }));
    });

    //get home data
    on<HomeLatest>(
      //if state exists
      (event, emit) async {
        if (state.homeLatestList.isNotEmpty) {
          emit(state.copyWith(
              isLoading: false,
              isError: false,
              homeLatestList: state.homeLatestList));
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
