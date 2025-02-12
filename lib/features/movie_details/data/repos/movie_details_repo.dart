import 'package:dartz/dartz.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/core/networking/api_error_model.dart';
import 'package:movie_app/core/networking/api_service.dart';
import 'package:movie_app/features/movie_details/data/models/movie_details_response.dart';
import 'package:movie_app/features/movie_details/data/models/rating_request_body.dart';
import 'package:movie_app/features/movie_details/data/models/rating_response.dart';

class MovieDetailsRepo {
  final ApiService _apiService;

  MovieDetailsRepo(this._apiService);

  Future<Either<ApiErrorModel, MovieDetailsResponse>> getMovieDetails(
      int movieId) async {
    try {
      final response = await _apiService.getMovieDetails(movieId);
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, MoviesResponse>> getMovieRecommendations(
      int movieId) async {
    try {
      final response = await _apiService.getMovieRecommendations(movieId);
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, MoviesResponse>> getMovieSimilar(
      int movieId) async {
    try {
      final response = await _apiService.getMovieSimilar(movieId);
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, RatingResponse>> ratingMovie({
    required RatingRequestBody rating,
    required int movieId,
  }) async {
    try {
      final response =
          await _apiService.ratingMovie(movieId: movieId, rating: rating);
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
