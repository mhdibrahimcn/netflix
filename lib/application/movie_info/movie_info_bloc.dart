import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/movie_info/models/movie_info_model/movie_info_model.dart';
import 'package:netflix/domain/movie_info/movie_info_service.dart';

part 'movie_info_bloc.freezed.dart';
part 'movie_info_event.dart';
part 'movie_info_state.dart';

@injectable
class MovieInfoBloc extends Bloc<MovieInfoEvent, MovieInfoState> {
  final MovieInfoService _movieInfoService;
  MovieInfoBloc(this._movieInfoService) : super(MovieInfoState.initial()) {
    on<MovieInfoEvent>((event, emit) async {
      //initializing
      emit(state.copyWith(
        isLoading: true,
        isError: false,
        movieInfo: null,
      ));
      final movieInfoModel =
          await _movieInfoService.getMovieInfoData(event.movieId);
      log(movieInfoModel.toString());
      emit(movieInfoModel.fold(
        (MainFailure failure) => state.copyWith(
          isLoading: false,
          isError: true,
          movieInfo: null,
        ),
        (MovieInfoModel movieInfo) => state.copyWith(
          isLoading: false,
          isError: false,
          movieInfo: movieInfo,
        ),
      ));
    });
  }
}
