import 'package:movie_app/core/models/movies_response.dart';

sealed class SearchState {}

class SearchInitialState extends SearchState {}

class LoadingSearch extends SearchState {}

class SuccessSearch extends SearchState {
  final MoviesResponse searchResult;

  SuccessSearch({required this.searchResult});
}

class ErrorSearch extends SearchState {
  final String error;

  ErrorSearch({required this.error});
}
