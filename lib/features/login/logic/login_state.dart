import 'package:movie_app/features/login/data/models/login_response.dart';

sealed class LoginState {}

class InitState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final LoginResponse response;

  SuccessLoginState({required this.response});
}

class ErrorLoginState extends LoginState {
  final String message;

  ErrorLoginState({required this.message});
}
