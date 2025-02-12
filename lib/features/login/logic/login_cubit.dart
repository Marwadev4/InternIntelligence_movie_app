import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/constants.dart';
import 'package:movie_app/core/helpers/shared_pref_helper.dart';
import 'package:movie_app/features/login/data/repos/login_repo.dart';
import 'package:movie_app/features/login/logic/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(InitState());

  // List<SpecializationsData?>? specializationsList = [];
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(LoadingLoginState());
    final response = await _loginRepo.createGuestSession();
    response.fold((error) {
      emit(ErrorLoginState(message: error.message ?? 'Failure'));
    }, (createSession) async {
      isLoggedInUser = true;
      guestSessionId = createSession.guestSessionId;
      await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.guestSessionId, guestSessionId);
      emit(SuccessLoginState(response: createSession));
    });
  }
}
