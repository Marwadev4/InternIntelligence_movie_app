import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:movie_app/features/sign_up/ui/widgets/sign_up_form.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/app_button.dart';
import '../logic/sign_up_cubit.dart';
import 'widgets/already_have_account_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font30White600,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(150),
                Column(
                  children: [
                    const SignupForm(),
                    verticalSpace(40),
                    AppButton(
                      buttonText: "Sign Up",
                      isFullWeight: true,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalSpace(40),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
