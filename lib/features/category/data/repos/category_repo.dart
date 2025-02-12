import 'package:dartz/dartz.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/core/networking/api_error_model.dart';
import 'package:movie_app/core/networking/api_service.dart';

class CategoryRepo {
  final ApiService _apiService;

  CategoryRepo(this._apiService);

  Future<Either<ApiErrorModel, MoviesResponse>> getCategoryMovies(
      int categoryId) async {
    try {
      final response = await _apiService.getCategoryMovies(categoryId);
      return right(response);
    } catch (error) {
      print(error);
      return left(ApiErrorHandler.handle(error));
    }
  }
}
