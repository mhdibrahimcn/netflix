part of 'movie_info_bloc.dart';

@freezed
class MovieInfoEvent with _$MovieInfoEvent {
  const factory MovieInfoEvent.getMovieInfo(int movieId) = GetMovieInfo;
  const factory MovieInfoEvent.getMovieVideoLink(int movieId) =
      GetMovieVideoLink;
}
