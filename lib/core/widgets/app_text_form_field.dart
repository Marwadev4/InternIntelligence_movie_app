import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Color? mainColor;
  final IconData prefixIcon;
  final Function(String)? onChanged;

  const AppTextFormField({
    super.key,
    this.maxLines,
    this.onChanged,
    this.mainColor,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManager.primaryIconBkColor,
              ),
              padding: EdgeInsets.all(8.h),
              child: Icon(
                prefixIcon,
                color: ColorsManager.iconColor,
                size: 25.sp,
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: TextFormField(
                controller: controller,
                maxLines: maxLines ?? 1,
                keyboardType: keyboardType,
                onChanged: onChanged,
                cursorColor: ColorsManager.borderColor,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                  hintStyle: TextStyles.font20Gray500,
                  hintText: hintText,
                  suffixIcon: suffixIcon,
                ),
                obscureText: isObscureText ?? false,
                style: TextStyles.font20Gray500,
                validator: validator,
              ),
            ),
          ],
        ),
        Divider(
          color: ColorsManager.borderColor,
          height: 1.3,
          thickness: 2.h,
        ),
      ],
    );
  }
}
