import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/features/movie_details/data/models/movie_details_response.dart';
import 'package:movie_app/features/movie_details/data/models/rating_response.dart';

abstract class MovieDetailsState {}

class InitMovieDetailsState extends MovieDetailsState {}

class LoadingMovieDetails extends MovieDetailsState {}

class SuccessMovieDetails extends MovieDetailsState {
  final MovieDetailsResponse movieDetailsResponse;

  SuccessMovieDetails({required this.movieDetailsResponse});
}

class ErrorMovieDetails extends MovieDetailsState {
  final String error;

  ErrorMovieDetails({required this.error});
}

class LoadingMovieRecommendations extends MovieDetailsState {}

class SuccessMovieRecommendations extends MovieDetailsState {
  final MoviesResponse moviesResponse;

  SuccessMovieRecommendations({required this.moviesResponse});
}

class ErrorMovieRecommendations extends MovieDetailsState {
  final String error;

  ErrorMovieRecommendations({required this.error});
}

class LoadingMovieSimilar extends MovieDetailsState {}

class SuccessMovieSimilar extends MovieDetailsState {
  final MoviesResponse moviesResponse;

  SuccessMovieSimilar({required this.moviesResponse});
}

class ErrorMovieSimilar extends MovieDetailsState {
  final String error;

  ErrorMovieSimilar({required this.error});
}

class LoadingRatingMovie extends MovieDetailsState {}

class SuccessRatingMovie extends MovieDetailsState {
  final RatingResponse ratingResponse;

  SuccessRatingMovie({required this.ratingResponse});
}

class ErrorRatingMovie extends MovieDetailsState {
  final String error;

  ErrorRatingMovie({required this.error});
}
