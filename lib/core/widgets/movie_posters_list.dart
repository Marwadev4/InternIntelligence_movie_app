import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/theming/colors.dart';

class MoviePostersList extends StatelessWidget {
  const MoviePostersList({super.key, required this.movies});

  final List<MovieResponse> movies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.pushNamed(
                Routes.movieDetailsScreen,
                arguments: movies[index],
              );
            },
            child: Container(
              height: 200.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: ColorsManager.primaryCardColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/original${movies[index].posterPath}",
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Image.asset('assets/images/loading.gif'),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 380.h,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => horizontalSpace(20),
        itemCount: movies.length,
      ),
    );
  }
}
