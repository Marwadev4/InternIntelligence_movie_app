import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/core/widgets/movie_posters_list.dart';
import 'package:movie_app/core/widgets/loading_movie_posters_list.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_state.dart';

class RecommendationsMovies extends StatelessWidget {
  const RecommendationsMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommendations',
          style: TextStyles.font30White600,
        ),
        verticalSpace(10),
        BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          buildWhen: (previous, current) =>
              current is SuccessMovieRecommendations ||
              current is ErrorMovieRecommendations ||
              current is LoadingMovieRecommendations,
          builder: (context, state) {
            if (state is SuccessMovieRecommendations) {
              List<MovieResponse> movies = state.moviesResponse.movies;
              return MoviePostersList(movies: movies);
            } else if (state is ErrorMovieRecommendations) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return LoadingMoviePostersList();
          },
        ),
      ],
    );
  }
}
