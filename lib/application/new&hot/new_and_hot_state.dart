part of 'new_and_hot_bloc.dart';

@freezed
class NewAndHotState with _$NewAndHotState {
  const factory NewAndHotState(
          {required bool isLoading,
          required bool isError,
          required List<UpcomingMovieResults> upcomingMovieList,
          required List<EveryoneWatchingResult> everyoneWatchingList}) =
      _NewAndHotState;
  factory NewAndHotState.initial() => const NewAndHotState(
      isLoading: true,
      upcomingMovieList: [],
      isError: false,
      everyoneWatchingList: []);
}
