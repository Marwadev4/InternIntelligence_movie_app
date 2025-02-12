import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/features/login/logic/login_cubit.dart';
import 'package:movie_app/features/login/logic/login_state.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoadingLoginState ||
          current is SuccessLoginState ||
          current is ErrorLoginState,
      listener: (context, state) {
        if (state is SuccessLoginState) {
          showSuccessDialog(context);
        } else if (state is ErrorLoginState) {
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
    context.pop();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorsManager.primaryCardColor,
          title: Text(
            'Login Successful',
            style: TextStyles.font22White500,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Congratulations, you have logged in successfully!',
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
