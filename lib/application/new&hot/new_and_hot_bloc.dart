import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/new&hot/hot_and_new_service.dart';
import 'package:netflix/domain/new&hot/models/everyone_watching/everyone_watching.dart';
import 'package:netflix/domain/new&hot/models/upcoming_movies/upcoming_movies.dart';

part 'new_and_hot_bloc.freezed.dart';
part 'new_and_hot_event.dart';
part 'new_and_hot_state.dart';

@injectable
class NewAndHotBloc extends Bloc<NewAndHotEvent, NewAndHotState> {
  final HotAndNewService _hotAndNewMovieService;

  NewAndHotBloc(this._hotAndNewMovieService) : super(NewAndHotState.initial()) {
    on<GetUpcomingMovieData>((event, emit) async {
      if (state.upcomingMovieList.isNotEmpty) {
        emit(state.copyWith(upcomingMovieList: state.upcomingMovieList));
      }

      final upcomingMovieList =
          await _hotAndNewMovieService.getUpcomingMovieData();
      emit(upcomingMovieList.fold(
          (MainFailure failure) => state.copyWith(
                isLoading: false,
                isError: true,
                upcomingMovieList: [],
              ), (UpcomingMoviesModel list) {
        List<UpcomingMovieResults> sortedMovies = list.results;
        final dateFormat =
            DateFormat('yyyy-MM-dd'); // Adjust date format as needed
        sortedMovies.sort((a, b) {
          if (a.releaseDate == null && b.releaseDate == null) return 0;
          if (a.releaseDate == null) return 1;
          if (b.releaseDate == null) return -1;
          return dateFormat
              .parse(b.releaseDate!)
              .compareTo(dateFormat.parse(a.releaseDate!));
        });
        return state.copyWith(
          isLoading: false,
          isError: false,
          upcomingMovieList: list.results,
        );
      }));
    });
    on<GetEveryoneWatchingMovieData>(
      (event, emit) async {
        final everyoneWatchingList =
            await _hotAndNewMovieService.getEveryoneWatchingMovieData();
        emit(everyoneWatchingList.fold(
            (MainFailure failure) => state.copyWith(
                  isLoading: false,
                  isError: true,
                  everyoneWatchingList: [],
                ), (EveryoneWatchingModel list) {
          final shuffledList = list.results;
          shuffledList!.shuffle();

          return state.copyWith(
            isLoading: false,
            isError: true,
            everyoneWatchingList: shuffledList,
          );
        }));
      },
    );
  }
}
