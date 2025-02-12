import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/theming/colors.dart';

class MoviePostersGrid extends StatelessWidget {
  const MoviePostersGrid({super.key, required this.movies});

  final List<MovieResponse> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.h,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.7,
      ),
      itemCount: movies.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          context.pushNamed(
            Routes.movieDetailsScreen,
            arguments: movies[index],
          );
        },
        child: Container(
          width: double.infinity,
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
          ),
        ),
      ),
    );
  }
}
