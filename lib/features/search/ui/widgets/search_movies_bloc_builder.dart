import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/loading_movie_posters_grid.dart';
import 'package:movie_app/core/widgets/movie_posters_grid.dart';
import 'package:movie_app/features/search/logic/search_cubit.dart';
import 'package:movie_app/features/search/logic/search_states.dart';

class MovieResultsBlocBuilder extends StatelessWidget {
  const MovieResultsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) =>
          current is LoadingSearch ||
          current is SuccessSearch ||
          current is ErrorSearch ||
          current is SearchInitialState,
      builder: (context, state) {
        if (state is SuccessSearch) {
          List<MovieResponse> movies = state.searchResult.movies;
          String searchText = context.read<SearchCubit>().searchText.text;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              if (searchText != '')
                Text(
                  'Result of "$searchText"',
                  style: TextStyles.font22White500,
                ),
              verticalSpace(5),
              Expanded(
                child: MoviePostersGrid(movies: movies),
              ),
            ],
          );
        } else if (state is ErrorSearch) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/no_results.png',
                  width: 220.w,
                  height: 205.h,
                ),
                verticalSpace(20),
                Text(
                  'Oppps!',
                  style: TextStyles.font26White500,
                ),
                verticalSpace(10),
                Text(
                  'What are you looking for is not found',
                  style: TextStyles.font18Gray500,
                ),
              ],
            ),
          );
        } else if (state is LoadingSearch) {
          String searchText = context.read<SearchCubit>().searchText.text;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              if (searchText != '')
                Text(
                  'Result of "$searchText"',
                  style: TextStyles.font22White500,
                ),
              verticalSpace(5),
              Expanded(
                child: LoadingMoviePostersGrid(),
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
