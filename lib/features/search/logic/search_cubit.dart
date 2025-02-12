import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/search/data/models/search_requset_body.dart';
import 'package:movie_app/features/search/data/repos/search_repo.dart';

import 'search_states.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(SearchInitialState());

  TextEditingController searchText = TextEditingController();
  TextEditingController primaryReleaseYear = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController year = TextEditingController();
  bool adult = false;
  int page = 1;

  void emitSearchState() async {
    emit(LoadingSearch());
    final response = await _searchRepo.searchMovie(
      SearchRequestBody(
        query: searchText.text,
        adult: adult,
        primaryReleaseYear: primaryReleaseYear.text,
        region: region.text,
        year: year.text,
      ),
    );

    response.fold((error) {
      emit(ErrorSearch(error: error.message ?? 'Failure'));
    }, (searchResult) async {
      emit(SuccessSearch(searchResult: searchResult));
    });
  }

  void searchTextClear() {
    searchText.clear();
    emit(SearchInitialState());
  }
}
