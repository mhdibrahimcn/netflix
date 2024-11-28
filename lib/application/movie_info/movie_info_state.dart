part of 'movie_info_bloc.dart';

@freezed
class MovieInfoState with _$MovieInfoState {
  const factory MovieInfoState(
      {required bool isLoading,
      required bool isError,
      required MovieInfoModel? movieInfo,
      required List<MovieVideoResultLink> youtubeVideoId}) = _MovieInfoState;
  factory MovieInfoState.initial() => const MovieInfoState(
        isLoading: false,
        isError: false,
        movieInfo: null,
        youtubeVideoId: [],
      );
}
