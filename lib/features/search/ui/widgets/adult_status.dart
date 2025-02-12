import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/spacing.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/search/logic/search_cubit.dart';

class AdultStatusDropdown extends StatefulWidget {
  final SearchCubit cubit;

  const AdultStatusDropdown({super.key, required this.cubit});

  @override
  State<AdultStatusDropdown> createState() => _AdultStatusDropdownState();
}

class _AdultStatusDropdownState extends State<AdultStatusDropdown> {
  AdultStatus selectedItem = AdultStatus.nonAdult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Text(
            'Adult',
            style: TextStyles.font22White500,
          ),
          horizontalSpace(20),
          Expanded(
            flex: 3,
            child: DropdownButtonFormField<AdultStatus>(
              validator: (value) {
                if (value == null) {
                  return "Select thing";
                }
                return null;
              },
              dropdownColor: ColorsManager.primaryCardColor,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12.w, vertical: 0),
                border: OutlineInputBorder(
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
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                    color: ColorsManager.iconColor,
                  ),
                ),
                focusColor: ColorsManager.primaryCardColor,
                filled: true,
                fillColor: ColorsManager.primaryCardColor,
              ),
              value: selectedItem,
              borderRadius: BorderRadius.circular(8.r),
              focusColor: ColorsManager.primaryCardColor,
              items: AdultStatus.values
                  .map(
                    (status) => DropdownMenuItem<AdultStatus>(
                      value: status,
                      child: Text(
                        getCardText(status),
                        style: TextStyles.font20Gray500,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedItem = value!;
                  widget.cubit.adult =
                      value == AdultStatus.adult ? true : false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

enum AdultStatus {
  adult,
  nonAdult,
}

String getCardText(AdultStatus status) {
  switch (status) {
    case AdultStatus.adult:
      return 'Yes';
    case AdultStatus.nonAdult:
      return 'No';
  }
}
