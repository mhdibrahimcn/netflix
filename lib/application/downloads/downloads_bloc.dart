import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
part 'downloads_bloc.freezed.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      //initial emit
      emit(state.copyWith(
          isLoading: true, downloadsFailureOrSuccessOption: none()));
      //after
      final Either<MainFailure, List<Downloads>> downloadOptions =
          await _downloadsRepo.getDownloadsImage();
      log(downloadOptions.toString());

      emit(downloadOptions.fold(
        (failure) => state.copyWith(
            isLoading: false,
            downloadsFailureOrSuccessOption: Some(left(failure))),
        (success) => state.copyWith(
            isLoading: false,
            downloads: success,
            downloadsFailureOrSuccessOption: Some(right(success))),
      ));
    });
  }
}
