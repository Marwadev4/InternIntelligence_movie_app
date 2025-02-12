import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/features/home/logic/home_cubit.dart';
import 'package:movie_app/features/home/logic/home_state.dart';
import 'package:movie_app/core/widgets/loading_movie_posters_list.dart';
import 'package:movie_app/core/widgets/movie_posters_list.dart';
import 'package:movie_app/features/home/ui/widgets/row_text_button.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RowTextButton(
          text: 'Top Rated',
          onPressed: () {},
        ),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is SuccessTopRated ||
              current is ErrorTopRated ||
              current is LoadingTopRated,
          builder: (context, state) {
            if (state is SuccessTopRated) {
              List<MovieResponse> movies = state.moviesResponse.movies;
              return MoviePostersList(movies: movies);
            } else if (state is ErrorTopRated) {
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
