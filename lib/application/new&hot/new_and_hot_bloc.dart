import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/new&hot/models/upcoming_movies/upcoming_movies.dart';
import 'package:netflix/domain/new&hot/upcoming_movie_service.dart';

part 'new_and_hot_bloc.freezed.dart';
part 'new_and_hot_event.dart';
part 'new_and_hot_state.dart';

@injectable
class NewAndHotBloc extends Bloc<NewAndHotEvent, NewAndHotState> {
  final UpcomingMovieService _upcomingMovieService;

  NewAndHotBloc(this._upcomingMovieService) : super(NewAndHotState.initial()) {
    on<GetUpcomingMovieData>((event, emit) async {
      if (state.upcomingMovieList.isNotEmpty) {
        emit(state.copyWith(upcomingMovieList: state.upcomingMovieList));
      }

      final upcomingMovieList =
          await _upcomingMovieService.getUpcomingMovieData();
      emit(upcomingMovieList.fold(
          (MainFailure failure) => state.copyWith(
                isLoading: false,
                isError: true,
                upcomingMovieList: [],
              ), (UpcomingMoviesModel list) {
        return state.copyWith(
          isLoading: false,
          isError: false,
          upcomingMovieList: list.results,
        );
      }));
    });
  }
}
