part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isLoading,
    required bool isError,
    required List<Downloads> downloads,
  }) = _DownloadsState;

  factory DownloadsState.initial() {
    return const DownloadsState(
        isLoading: false, downloads: [], isError: false);
  }
}
