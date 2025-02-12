import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/movie_details/data/models/movie_details_response.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_state.dart';

class AboutMovie extends StatelessWidget {
  const AboutMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        buildWhen: (previous, current) =>
            current is SuccessMovieDetails ||
            current is ErrorMovieDetails ||
            current is LoadingMovieDetails,
        builder: (context, state) {
          if (state is SuccessMovieDetails) {
            MovieDetailsResponse movie = state.movieDetailsResponse;

            return Column(
              children: [
                RowInfo(
                  titleOne: 'Status',
                  infoOne: movie.status,
                  titleTwo: 'Original language',
                  infoTwo: movie.originalLanguage,
                ),
                RowInfo(
                  titleOne: 'Popularity',
                  infoOne: movie.popularity.toString(),
                  titleTwo: 'Tagline',
                  infoTwo: movie.tagline,
                ),
              ],
            );
          } else if (state is ErrorMovieDetails) {
            return Center(
              child: Text(
                state.error,
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return Column(
            children: [
              RowInfo(
                titleOne: 'Original language',
                infoOne: 'Loading...',
                titleTwo: 'Status',
                infoTwo: 'Loading...',
              ),
              RowInfo(
                titleOne: 'Tagline',
                infoOne: 'Loading...',
                titleTwo: 'Popularity',
                infoTwo: 'Loading...',
              ),
            ],
          );
        },
      ),
    );
  }
}

class RowInfo extends StatelessWidget {
  final String titleOne;
  final String infoOne;
  final String titleTwo;
  final String infoTwo;

  const RowInfo({
    super.key,
    required this.titleOne,
    required this.infoOne,
    required this.titleTwo,
    required this.infoTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Info(
          info: infoOne,
          title: titleOne,
        ),
        Info(
          info: infoTwo,
          title: titleTwo,
        ),
      ],
    );
  }
}

class Info extends StatelessWidget {
  final String title;
  final String info;

  const Info({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyles.font20Gray500,
          ),
          Text(
            info,
            style: TextStyles.font22White500,
          ),
        ],
      ),
    );
  }
}
