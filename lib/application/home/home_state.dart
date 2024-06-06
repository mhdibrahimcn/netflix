part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required bool isError,
    required List<HomeResultData> homeResultList,
  }) = _HomeState;
  factory HomeState.initial() =>
      const HomeState(isLoading: false, isError: false, homeResultList: []);
}
