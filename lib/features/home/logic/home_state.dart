import 'package:movie_app/core/models/category_response.dart';
import 'package:movie_app/core/models/movies_response.dart';

sealed class HomeState {}

class InitHomeState extends HomeState {}

class LoadingTrending extends HomeState {}

class SuccessTrending extends HomeState {
  final MoviesResponse moviesResponse;

  SuccessTrending({required this.moviesResponse});
}

class ErrorTrending extends HomeState {
  final String error;

  ErrorTrending({required this.error});
}

class LoadingPopular extends HomeState {}

class SuccessPopular extends HomeState {
  final MoviesResponse moviesResponse;

  SuccessPopular({required this.moviesResponse});
}

class ErrorPopular extends HomeState {
  final String error;

  ErrorPopular({required this.error});
}

class LoadingTopRated extends HomeState {}

class SuccessTopRated extends HomeState {
  final MoviesResponse moviesResponse;

  SuccessTopRated({required this.moviesResponse});
}

class ErrorTopRated extends HomeState {
  final String error;

  ErrorTopRated({required this.error});
}

class LoadingUpcoming extends HomeState {}

class SuccessUpcoming extends HomeState {
  final MoviesResponse moviesResponse;

  SuccessUpcoming({required this.moviesResponse});
}

class ErrorUpcoming extends HomeState {
  final String error;

  ErrorUpcoming({required this.error});
}

class LoadingNowPlaying extends HomeState {}

class SuccessNowPlaying extends HomeState {
  final MoviesResponse moviesResponse;

  SuccessNowPlaying({required this.moviesResponse});
}

class ErrorNowPlaying extends HomeState {
  final String error;

  ErrorNowPlaying({required this.error});
}

class LoadingLatest extends HomeState {}

class SuccessLatest extends HomeState {
  final MoviesResponse moviesResponse;

  SuccessLatest({required this.moviesResponse});
}

class ErrorLatest extends HomeState {
  final String error;

  ErrorLatest({required this.error});
}

class LoadingCategories extends HomeState {}

class SuccessCategories extends HomeState {
  final List<CategoryResponse> categories;

  SuccessCategories({required this.categories});
}

class ErrorCategories extends HomeState {
  final String error;

  ErrorCategories({required this.error});
}
