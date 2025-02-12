import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/features/home/logic/home_cubit.dart';
import 'package:movie_app/features/home/logic/home_state.dart';
import 'package:movie_app/features/home/ui/widgets/images_success_body.dart';

class ImagesSlider extends StatelessWidget {
  const ImagesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380.h,
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is SuccessTrending ||
            current is ErrorTrending ||
            current is LoadingTrending,
        builder: (context, state) {
          if (state is SuccessTrending) {
            List<MovieResponse> movies = state.moviesResponse.movies;
            return ImagesSuccessBody(movies: movies);
          } else if (state is ErrorTrending) {
            return Center(
              child: Text(
                state.error,
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return Container(
            height: 380.h,
            color: ColorsManager.primaryCardColor,
          );
        },
      ),
    );
  }
}
