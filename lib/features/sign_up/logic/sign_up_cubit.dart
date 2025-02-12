import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/constants.dart';
import 'package:movie_app/core/helpers/shared_pref_helper.dart';
import 'package:movie_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:movie_app/features/sign_up/logic/sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(InitState());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(LoadingSignupState());
    final response = await _signupRepo.createGuestSession();
    response.fold((error) {
      emit(ErrorSignupState(message: error.message ?? 'Failure'));
    }, (createSession) async {
      isLoggedInUser = true;
      guestSessionId = createSession.guestSessionId;
      await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.guestSessionId, guestSessionId);
      emit(SuccessSignupState(response: createSession));
    });
  }
}
