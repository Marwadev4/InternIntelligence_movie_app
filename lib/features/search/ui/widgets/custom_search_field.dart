import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/search/logic/search_cubit.dart';
import 'package:movie_app/features/search/ui/widgets/adult_status.dart';
import 'package:movie_app/features/search/ui/widgets/search_text_field.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SearchCubit cubit = context.read<SearchCubit>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        Expanded(
          child: TextField(
            controller: cubit.searchText,
            onChanged: (value) {
              cubit.emitSearchState();
            },
            cursorColor: ColorsManager.iconColor,
            style: TextStyles.font22White500,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: ColorsManager.searchBarColor,
              hintText: 'Search by title, genre, actor',
              hintStyle: TextStyles.font18Gray500,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
                borderSide: BorderSide(
                  color: ColorsManager.searchBarColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
                borderSide: BorderSide(
                  color: ColorsManager.searchBarColor,
                ),
              ),
              prefixIcon: IconButton(
                onPressed: () {
                  showFilterDialog(
                    context: context,
                  );
                },
                icon: Icon(
                  Icons.filter_list,
                  size: 24.sp,
                  color: Colors.white,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  cubit.searchTextClear();
                },
                icon: Card(
                  shape: CircleBorder(),
                  color: ColorsManager.iconBkColor,
                  child: Padding(
                    padding: EdgeInsets.all(5.h),
                    child: Icon(
                      Icons.close,
                      size: 22.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void showFilterDialog({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (_) {
      SearchCubit cubit = context.read<SearchCubit>();
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        backgroundColor: ColorsManager.primaryCardColor,
        child: Padding(
            padding: EdgeInsets.all(16.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Filter',
                    style: TextStyles.font22White500,
                  ),
                  verticalSpace(20),
                  CustomSearchRowOrColumn(
                    labelText: 'Search by title, genre, actor',
                    keyboardType: TextInputType.name,
                    controller: cubit.searchText,
                    isRow: false,
                  ),
                  AdultStatusDropdown(
                    cubit: cubit,
                  ),
                  CustomSearchRowOrColumn(
                    labelText: 'Primary release year',
                    keyboardType: TextInputType.phone,
                    controller: cubit.primaryReleaseYear,
                    isRow: false,
                  ),
                  CustomSearchRowOrColumn(
                    labelText: 'Year',
                    keyboardType: TextInputType.phone,
                    controller: cubit.year,
                    isRow: true,
                  ),
                  CustomSearchRowOrColumn(
                    labelText: 'Region',
                    keyboardType: TextInputType.name,
                    controller: cubit.region,
                    isRow: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyles.font18PrimaryTextColor500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          cubit.emitSearchState();
                          context.pop();
                        },
                        child: Text(
                          'Ok',
                          style: TextStyles.font18PrimaryTextColor500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      );
    },
  );
}
