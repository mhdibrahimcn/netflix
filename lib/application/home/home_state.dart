part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required bool isError,
    required List<HomeResultData> homeResultList,
    required List<HomeLatestResultData> homeLatestList,
    required List<Downloads> homeTrendingList,
    required List<HomeDramaGenreResult> homeDramaGenreList,
    required List<HomeTvShowResult> homeTvShowList,
  }) = _HomeState;
  factory HomeState.initial() => const HomeState(
      isLoading: false,
      isError: false,
      homeResultList: [],
      homeLatestList: [],
      homeTrendingList: [],
      homeDramaGenreList: [],
      homeTvShowList: []);
}
