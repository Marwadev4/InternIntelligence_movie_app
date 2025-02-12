import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';

class CustomSearchRowOrColumn extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isRow;

  const CustomSearchRowOrColumn({
    super.key,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    required this.isRow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: isRow
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  labelText,
                  style: TextStyles.font22White500,
                ),
                horizontalSpace(20),
                Expanded(
                  flex: 3,
                  child: SearchTextField(
                    controller: controller,
                    keyboardType: keyboardType,
                    labelText: labelText,
                  ),
                ),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labelText,
                  style: TextStyles.font22White500,
                ),
                verticalSpace(5),
                SearchTextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  labelText: labelText,
                ),
              ],
            ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const SearchTextField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: ColorsManager.borderColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(
            color: ColorsManager.iconColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(
            color: ColorsManager.iconColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(
            color: ColorsManager.iconColor,
          ),
        ),
        filled: true,
        fillColor: ColorsManager.primaryCardColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      ),
      style: TextStyles.font18White500,
    );
  }
}
