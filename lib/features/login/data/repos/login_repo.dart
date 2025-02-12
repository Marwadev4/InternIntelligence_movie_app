import 'package:dartz/dartz.dart';
import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/core/networking/api_error_model.dart';
import 'package:movie_app/core/networking/api_service.dart';
import 'package:movie_app/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<Either<ApiErrorModel, LoginResponse>> createGuestSession() async {
    try {
      final response = await _apiService.createGuestSession();
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
