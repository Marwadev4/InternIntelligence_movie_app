import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/colors.dart';

class LoadingMoviePostersGrid extends StatelessWidget {
  const LoadingMoviePostersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.h,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.7,
      ),
      itemCount: 20,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.primaryCardColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}
