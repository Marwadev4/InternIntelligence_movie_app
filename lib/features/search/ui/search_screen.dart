import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/search/ui/widgets/custom_search_field.dart';
import 'package:movie_app/features/search/ui/widgets/search_movies_bloc_builder.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsetsDirectional.only(top: 20.h, start: 20.w, end: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchField(),
              const Expanded(
                child: MovieResultsBlocBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
