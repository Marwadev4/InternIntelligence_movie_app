import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/routing/routes.dart';

import '../../../../core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Don\'t have an account?',
          style: TextStyles.font18Gray500,
        ),
        InkWell(
          onTap: () {
            context.pushNamed(Routes.signupScreen);
          },
          child: Text(
            'Sign up now',
            style: TextStyles.font18PrimaryTextColor500,
          ),
        ),
      ],
    );
  }
}
