import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/constants.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';

class RateBar extends StatelessWidget {
  final double rating;
  final int movieId;

  const RateBar({super.key, required this.rating, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20.w,
      children: [
        Icon(
          Icons.star,
          size: 25.sp,
          color: ColorsManager.iconColor,
        ),
        Text(
          rating.toString(),
          style: TextStyles.font22White500,
        ),
        InkWell(
          onTap: () {
            showInfoDialog(
              context: context,
              rating: rating,
              movieId: movieId,
            );
          },
          child: Text(
            'Rate',
            style: TextStyles.font18PrimaryTextColor500.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: ColorsManager.primaryTextColor,
            ),
          ),
        ),
      ],
    );
  }
}

void showInfoDialog({
  required BuildContext context,
  required double rating,
  required int movieId,
}) {
  showDialog(
    context: context,
    builder: (_) {
      MovieDetailsCubit cubit = context.read<MovieDetailsCubit>();
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        backgroundColor: ColorsManager.primaryCardColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
          child: isLoggedInUser
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Rate This Movie',
                      style: TextStyles.font20Gray500,
                    ),
                    verticalSpace(20),
                    Flexible(
                      child: AnimatedRatingStars(
                        initialRating: rating,
                        minRating: 0.0,
                        maxRating: 10.0,
                        filledColor: ColorsManager.iconColor,
                        emptyColor: Colors.grey,
                        filledIcon: Icons.star,
                        halfFilledIcon: Icons.star_half,
                        emptyIcon: Icons.star_border,
                        onChanged: (double rating) {
                          cubit.ratingValue = rating;
                        },
                        displayRatingValue: true,
                        customFilledIcon: Icons.star,
                        customHalfFilledIcon: Icons.star_half,
                        customEmptyIcon: Icons.star_border,
                        starSize: 22.sp,
                        animationDuration: Duration(milliseconds: 300),
                        animationCurve: Curves.easeInOut,
                        readOnly: false,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyles.font18PrimaryTextColor500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            cubit.ratingMovie(movieId);
                          },
                          child: Text(
                            'Ok',
                            style: TextStyles.font18PrimaryTextColor500,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Please',
                      style: TextStyles.font18Gray500,
                    ),
                    TextButton(
                      onPressed: () => context.pushNamed(Routes.loginScreen),
                      child: Text(
                        'Login',
                        style: TextStyles.font18PrimaryTextColor500,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyles.font18Gray500,
                    ),
                    TextButton(
                      onPressed: () => context.pushNamed(Routes.signupScreen),
                      child: Text(
                        'SignUp',
                        style: TextStyles.font18PrimaryTextColor500,
                      ),
                    ),
                    Text(
                      'to be able to rate this movie',
                      style: TextStyles.font18Gray500,
                    ),
                  ],
                ),
        ),
      );
    },
  );
}
