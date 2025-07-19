import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/app_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding_bk.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              CircleAvatar(
                radius: 50.r,
                backgroundColor: ColorsManager.primaryBtnColor,
                child: SvgPicture.asset(
                  'assets/svgs/logo.svg',
                  height: 40.h,
                  width: 40.w,
                ),
              ),
              verticalSpace(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Movie',
                    style: TextStyles.font35White700,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'start',
                    style: TextStyles.font35PrimaryTextColor700,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              verticalSpace(16),
              Text(
                'Find and browse your favorite movies\nanywhere and anytime',
                style: TextStyles.font20Gray500,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              AppButton(
                buttonText: 'Next',
                onPressed: () {
                  context.pushNamed(Routes.navbarScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
