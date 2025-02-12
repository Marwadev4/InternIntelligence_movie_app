import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Already have an account?',
          style: TextStyles.font18Gray500,
        ),
        InkWell(
          onTap: () {
            context.pushNamed(Routes.loginScreen);
          },
          child: Text(
            'Login now',
            style: TextStyles.font18PrimaryTextColor500,
          ),
        ),
      ],
    );
  }
}
