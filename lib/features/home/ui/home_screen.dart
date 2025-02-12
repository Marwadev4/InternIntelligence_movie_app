import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/home/logic/home_cubit.dart';
import 'package:movie_app/features/home/ui/widgets/categories_list.dart';
import 'package:movie_app/features/home/ui/widgets/images_slider.dart';
import 'package:movie_app/features/home/ui/widgets/now_playing_movies.dart';
import 'package:movie_app/features/home/ui/widgets/popular_movies.dart';
import 'package:movie_app/features/home/ui/widgets/top_rated_movies.dart';
import 'package:movie_app/features/home/ui/widgets/upcoming_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          final homeCubit = context.read<HomeCubit>();
          homeCubit.getTrendingMovies();
          homeCubit.getPopularMovies();
          homeCubit.getTopRatedMovies();
          homeCubit.getUpcomingMovies();
          homeCubit.getNowPlayingMovies();
          homeCubit.getCategories();
        },
        color: ColorsManager.iconColor,
        backgroundColor: ColorsManager.primaryCardColor,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 80.h),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImagesSlider(),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyles.font30White600,
                    ),
                    verticalSpace(5),
                    CategoriesList(),
                    verticalSpace(5),
                    PopularMovies(),
                    TopRatedMovies(),
                    UpcomingMovies(),
                    NowPlayingMovies(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
