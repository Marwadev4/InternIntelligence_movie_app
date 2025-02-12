import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesSuccessBody extends StatefulWidget {
  const ImagesSuccessBody({super.key, required this.movies});

  final List<MovieResponse> movies;

  @override
  State<ImagesSuccessBody> createState() => _ImagesSuccessBodyState();
}

class _ImagesSuccessBodyState extends State<ImagesSuccessBody> {
  int _currentPage = 0;
  Timer? timer;

  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (controller.hasClients) {
        if (_currentPage < widget.movies.length) {
          ++_currentPage;
        } else {
          _currentPage = 0;
        }

        controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380.h,
      child: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                context.pushNamed(
                  Routes.movieDetailsScreen,
                  arguments: widget.movies[index],
                );
              },
              child: Container(
                height: 380.h,
                width: double.infinity,
                decoration:
                    BoxDecoration(color: ColorsManager.primaryCardColor),
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
                child: CachedNetworkImage(
                  imageUrl:
                      "https://image.tmdb.org/t/p/original${widget.movies[index].posterPath}",
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      Image.asset('assets/images/loading.gif'),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 380.h,
                ),
              ),
            ),
            itemCount: widget.movies.length,
            physics: BouncingScrollPhysics(),
            controller: controller,
            reverse: false,
            scrollDirection: Axis.horizontal,
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0.h,
            child: Container(
              // height: 35.h,
              decoration: BoxDecoration(
                color: ColorsManager.bkColor.withOpacity(.5),

                // gradient: LinearGradient(
                //   colors: [
                //     ColorsManager.bkColor.withOpacity(.0),
                //     ColorsManager.bkColor.withOpacity(.1),
                //     ColorsManager.bkColor.withOpacity(.1),
                //     ColorsManager.bkColor.withOpacity(.8),
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   // stops: const [30, 30, 40],
                // ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 20.h,
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: widget.movies.length,
                effect: ExpandingDotsEffect(
                  dotColor: ColorsManager.grey.withOpacity(0.3),
                  activeDotColor: ColorsManager.iconColor,
                  spacing: 5,
                  dotHeight: 6,
                  dotWidth: 6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
