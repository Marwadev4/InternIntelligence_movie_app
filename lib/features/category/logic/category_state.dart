import 'package:movie_app/core/models/movies_response.dart';

abstract class CategoryState {}

class InitCategoryState extends CategoryState {}

class LoadingCategoryMovies extends CategoryState {}

class SuccessCategoryMovies extends CategoryState {
  final MoviesResponse moviesResponse;

  SuccessCategoryMovies({required this.moviesResponse});
}

class ErrorCategoryMovies extends CategoryState {
  final String error;

  ErrorCategoryMovies({required this.error});
}
