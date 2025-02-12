import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/features/navbar/logic/navigation_cubit.dart';
import 'package:movie_app/features/navbar/logic/navigation_states.dart';
import 'package:movie_app/features/navbar/ui/widgets/navbar_icon.dart';

class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationBarCubit cubit = context.read<NavigationBarCubit>();

    return BlocBuilder<NavigationBarCubit, NavigationStates>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return false;
          },
          child: Scaffold(
            body: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  cubit.screens[cubit.bottomNavIndex].screen,

                  /// Custom Bottom Navigation Bar
                  Positioned(
                    bottom: 18,
                    left: 18,
                    right: 18,
                    height: 68.h,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: ColorsManager.navbarColor.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Bottom Navigation bar items
                  Positioned(
                    bottom: 18,
                    left: 22,
                    right: 22,
                    height: 68.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                        cubit.screens.length,
                        (index) => NavbarIcon(
                          icon: cubit.screens[index].icon,
                          index: index,
                          cubit: cubit,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
