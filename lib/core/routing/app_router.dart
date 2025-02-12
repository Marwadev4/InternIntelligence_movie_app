import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/dependency_injection.dart';
import 'package:movie_app/core/models/category_response.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/category/logic/category_cubit.dart';
import 'package:movie_app/features/category/ui/category_screen.dart';
import 'package:movie_app/features/login/logic/login_cubit.dart';
import 'package:movie_app/features/login/ui/login_screen.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/ui/movie_details_screen.dart';
import 'package:movie_app/features/navbar/logic/navigation_cubit.dart';
import 'package:movie_app/features/navbar/ui/navbar_screen.dart';
import 'package:movie_app/features/onboarding/onboarding_screen.dart';
import 'package:movie_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:movie_app/features/sign_up/ui/sign_up_screen.dart';

/// Manage Routes
class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());

      case Routes.navbarScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<NavigationBarCubit>(),
            child: const NavigationBarScreen(),
          ),
        );

      case Routes.movieDetailsScreen:
        MovieResponse movieResponse = settings.arguments as MovieResponse;
        int movieId = movieResponse.id;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<MovieDetailsCubit>()
              ..getMovieDetails(movieId)
              ..getMovieRecommendations(movieId)
              ..getMovieSimilar(movieId),
            child: MovieDetailsScreen(
              movie: movieResponse,
            ),
          ),
        );

      case Routes.categoryScreen:
        CategoryResponse category = settings.arguments as CategoryResponse;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                getIt<CategoryCubit>()..getCategoryMovies(category.id),
            child: CategoryScreen(
              categoryName: category.name,
            ),
          ),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
