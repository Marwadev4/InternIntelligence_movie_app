import 'package:dartz/dartz.dart';
import 'package:movie_app/core/models/category_response.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/core/networking/api_error_model.dart';
import 'package:movie_app/core/networking/api_service.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<Either<ApiErrorModel, MoviesResponse>> getTrendingMovies() async {
    try {
      final response = await _apiService.getTrending();
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, MoviesResponse>> getPopularMovies() async {
    try {
      final response = await _apiService.getPopular();
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, MoviesResponse>> getTopRatedMovies() async {
    try {
      final response = await _apiService.getTopRated();
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, MoviesResponse>> getUpcomingMovies() async {
    try {
      final response = await _apiService.getUpcoming();
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, MoviesResponse>> getNowPlayingMovies() async {
    try {
      final response = await _apiService.getNowPlaying();
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, MoviesResponse>> getLatest() async {
    try {
      final response = await _apiService.getLatest();
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, List<CategoryResponse>>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
