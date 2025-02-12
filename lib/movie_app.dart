import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routing/app_router.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/theming/colors.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(460, 900),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SmoochSans',
          primaryColor: ColorsManager.primaryBtnColor,
          scaffoldBackgroundColor: ColorsManager.bkColor,
        ),
        initialRoute: Routes.onboardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
