part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required bool isLoading,
    required bool isError,
    required List<SearchResultData> searchResultList,
    required List<Downloads> idleList,
  }) = _SearchState;
  factory SearchState.initial() => const SearchState(
      isLoading: false, isError: false, searchResultList: [], idleList: []);
}
