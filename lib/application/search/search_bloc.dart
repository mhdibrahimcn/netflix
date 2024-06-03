import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/faliures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/search/models/search_response/search_response.dart';
import 'package:netflix/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadService;
  final SearchService _searchService;
  SearchBloc(this._downloadService, this._searchService)
      : super(SearchState.initial()) {
    //idle state
    on<Initialize>((event, emit) async {
      //initially
      emit(state.copyWith(
          isLoading: true, isError: false, idleList: [], searchResultList: []));
      //get trending
      final _result = await _downloadService.getDownloadsImage();
      //show to ui
      emit(_result.fold((MainFailure failure) {
        return state
            .copyWith(isLoading: true, idleList: [], searchResultList: []);
      }, (List<Downloads> list) {
        return state.copyWith(
            isLoading: false,
            isError: false,
            idleList: list,
            searchResultList: []);
      }));
    });
    //search state
    on<SearchMovies>((event, emit) {
      //call search movie api
      _searchService.searchMovies(movieQuery: event.movieQuery);
      //sho w to UI
    });
  }
}
