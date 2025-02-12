import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/models/category_response.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/home/logic/home_cubit.dart';
import 'package:movie_app/features/home/logic/home_state.dart';
import 'package:movie_app/features/home/ui/widgets/text_button.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SuccessCategories ||
          current is ErrorCategories ||
          current is LoadingCategories,
      builder: (context, state) {
        if (state is SuccessCategories) {
          List<CategoryResponse> categories = state.categories;
          return CategoriesSuccessBody(categories: categories);
        } else if (state is ErrorCategories) {
          return Center(
            child: Text(
              state.error,
              style: TextStyle(color: Colors.white),
            ),
          );
        }
        return LoadingCategoriesBody();
      },
    );
  }
}

class LoadingCategoriesBody extends StatelessWidget {
  const LoadingCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: 40.h,
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            child: Text(
              'Loading',
              style: TextStyles.font20Gray500,
            ),
          ),
        ),
        itemCount: 10,
        separatorBuilder: (context, index) => horizontalSpace(10),
      ),
    );
  }
}

class CategoriesSuccessBody extends StatelessWidget {
  const CategoriesSuccessBody({super.key, required this.categories});

  final List<CategoryResponse> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Textbutton(
          text: categories[index].name,
          onPressed: () {
            context.pushNamed(Routes.categoryScreen,
                arguments: categories[index]);
          },
        ),
        itemCount: categories.length,
        separatorBuilder: (context, index) => horizontalSpace(10),
      ),
    );
  }
}
