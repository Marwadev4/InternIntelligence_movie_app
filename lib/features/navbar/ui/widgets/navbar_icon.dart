import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/features/navbar/logic/navigation_cubit.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NavbarIcon extends StatelessWidget {
  final IconData icon;
  final int index;
  final NavigationBarCubit cubit;

  const NavbarIcon({
    super.key,
    required this.icon,
    required this.index,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      beginCurve: Curves.easeIn,
      endDuration: Duration(milliseconds: 5000),
      onTap: () {
        cubit.changeIndexInBottomNav(index);
      },
      child: Icon(
        icon,
        color: cubit.bottomNavIndex == index
            ? ColorsManager.iconColor
            : ColorsManager.lightGrey,
        size: 30,
      ),
    );
  }
}
