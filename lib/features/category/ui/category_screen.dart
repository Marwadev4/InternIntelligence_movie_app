import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/loading_movie_posters_grid.dart';
import 'package:movie_app/core/widgets/movie_posters_grid.dart';
import 'package:movie_app/features/category/logic/category_cubit.dart';
import 'package:movie_app/features/category/logic/category_state.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryName});

  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60.w,
        leading: Padding(
          padding: EdgeInsetsDirectional.only(top: 4.h, start: 18.w),
          child: CircleAvatar(
            backgroundColor: ColorsManager.secondaryIconBkColor,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 25.sp,
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          categoryName,
          style: TextStyles.font30White600,
        ),
        centerTitle: true,
        backgroundColor: ColorsManager.bkColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          buildWhen: (previous, current) =>
              current is SuccessCategoryMovies ||
              current is ErrorCategoryMovies ||
              current is LoadingCategoryMovies,
          builder: (context, state) {
            if (state is SuccessCategoryMovies) {
              List<MovieResponse> movies = state.moviesResponse.movies;
              return MoviePostersGrid(movies: movies);
            } else if (state is ErrorCategoryMovies) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return LoadingMoviePostersGrid();
          },
        ),
      ),
    );
  }
}
