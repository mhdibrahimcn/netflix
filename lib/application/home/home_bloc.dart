import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/home/home_service.dart';
import 'package:netflix/domain/home/models/home_model.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      if (state.homeResultList.isNotEmpty) {
        emit(state.copyWith(
            isLoading: false,
            isError: false,
            homeResultList: state.homeResultList));
        return;
      }
      emit(state.copyWith(isLoading: true, isError: false, homeResultList: []));
      final result = await _homeService.homeBg();
      log(result.toString());
      emit(result.fold(
          (MainFailure failure) => state.copyWith(
              isLoading: false,
              isError: true,
              homeResultList: []), (HomeBgModel list) {
        log(list.results.toString());
        return state.copyWith(
            isLoading: false, isError: true, homeResultList: list.results);
      }));
    });
  }
}
