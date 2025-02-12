import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/ui/widgets/about_movie.dart';
import 'package:movie_app/features/movie_details/ui/widgets/categories_row.dart';
import 'package:movie_app/features/movie_details/ui/widgets/dot_widget.dart';
import 'package:movie_app/features/movie_details/ui/widgets/expanded_text.dart';
import 'package:movie_app/features/movie_details/ui/widgets/rate_bar.dart';
import 'package:movie_app/features/movie_details/ui/widgets/rating_bloc_listener.dart';
import 'package:movie_app/features/movie_details/ui/widgets/recommendations_movies.dart';
import 'package:movie_app/features/movie_details/ui/widgets/similar_movies.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});

  final MovieResponse movie;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        MovieDetailsCubit cubit = context.read<MovieDetailsCubit>();
        cubit.getMovieRecommendations(movie.id);
        cubit.getMovieSimilar(movie.id);
        cubit.getMovieDetails(movie.id);
      },
      color: ColorsManager.iconColor,
      backgroundColor: ColorsManager.primaryCardColor,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 380.h,
                      width: double.infinity,
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorsManager.bkColor.withOpacity(.0),
                            ColorsManager.bkColor.withOpacity(.1),
                            ColorsManager.bkColor.withOpacity(.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // stops: const [30, 30, 40],
                        ),
                      ),
                      decoration:
                          BoxDecoration(color: ColorsManager.primaryCardColor),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://image.tmdb.org/t/p/original${movie.posterPath}",
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            Image.asset('assets/images/loading.gif'),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        height: 380.h,
                      ),
                    ),
                    PositionedDirectional(
                      start: 10.w,
                      top: 10.h,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(.3),
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
                  ],
                ),
                verticalSpace(10),
                Text(
                  movie.title,
                  style: TextStyles.font30White600,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(10),
                RateBar(
                  rating: movie.voteAverage ?? 0.0,
                  movieId: movie.id,
                ),
                verticalSpace(10),
                CategoriesRow(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      movie.releaseDate.year.toString(),
                      style: TextStyles.font20Gray500,
                    ),
                    DotWidget(),
                    Text(
                      '${movie.voteCount} vote',
                      style: TextStyles.font20Gray500,
                    ),
                    DotWidget(),
                    Text(
                      movie.adult ? 'Only Adult' : 'For all ages',
                      style: TextStyles.font20Gray500,
                    ),
                  ],
                ),
                ExpandedText(
                  overview: movie.overview,
                ),
                AboutMovie(),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RecommendationsMovies(),
                      SimilarMovies(),
                    ],
                  ),
                ),
                RatingBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
