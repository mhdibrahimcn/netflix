part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required isLoading,
    List<Downloads>? downloads,
  }) = _DownloadsState;
}
