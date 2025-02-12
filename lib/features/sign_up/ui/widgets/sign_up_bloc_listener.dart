import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:movie_app/features/sign_up/logic/sign_up_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is LoadingSignupState ||
          current is SuccessSignupState ||
          current is ErrorSignupState,
      listener: (context, state) {
        if (state is SuccessSignupState) {
          context.pop();
          showSuccessDialog(context);
        } else if (state is ErrorSignupState) {
          setupErrorState(context, state.message);
        }

        showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.iconColor,
            ),
          ),
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorsManager.primaryCardColor,
          title: Text(
            'Signup Successful',
            style: TextStyles.font22White500,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Congratulations, you have signed up successfully!',
                  style: TextStyles.font18Gray500,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: ColorsManager.iconColor,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                context.pushNamed(Routes.navbarScreen);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String message) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorsManager.primaryCardColor,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          message,
          style: TextStyles.font18Gray500,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font18PrimaryTextColor500,
            ),
          ),
        ],
      ),
    );
  }
}
