import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/core/networking/api_error_model.dart';
import 'package:movie_app/core/networking/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/features/search/data/models/search_requset_body.dart';

class SearchRepo {
  final ApiService _apiService;

  SearchRepo(this._apiService);

  Future<Either<ApiErrorModel, MoviesResponse>> searchMovie(
      SearchRequestBody search) async {
    try {
      final response = await _apiService.searchMovie(search);
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
