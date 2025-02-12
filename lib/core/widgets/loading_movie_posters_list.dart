import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/theming/colors.dart';

class LoadingMoviePostersList extends StatelessWidget {
  const LoadingMoviePostersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 200.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: ColorsManager.primaryCardColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
          );
        },
        separatorBuilder: (context, index) => horizontalSpace(20),
        itemCount: 8,
      ),
    );
  }
}
