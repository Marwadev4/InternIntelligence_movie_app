import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/category_response.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_state.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      buildWhen: (previous, current) =>
          current is SuccessMovieDetails ||
          current is ErrorMovieDetails ||
          current is LoadingMovieDetails,
      builder: (context, state) {
        if (state is SuccessMovieDetails) {
          List<CategoryResponse> categories =
              state.movieDetailsResponse.categories;
          String categoriesText = '';

          for (var category in categories) {
            categoriesText +=
                "${category.name}${categories.last != category ? ', ' : ''}";
          }

          return Text(
            categoriesText,
            style: TextStyles.font20Gray500,
            textAlign: TextAlign.center,
          );
        } else if (state is ErrorMovieDetails) {
          return Center(
            child: Text(
              state.error,
              style: TextStyle(color: Colors.white),
            ),
          );
        }
        return Text(
          'Loading...',
          style: TextStyles.font20Gray500,
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
