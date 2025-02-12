import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/core/di/dependency_injection.dart';
import 'package:movie_app/features/downloads/logic/downloads_cubit.dart';
import 'package:movie_app/features/downloads/ui/downloads_screen.dart';
import 'package:movie_app/features/home/logic/home_cubit.dart';
import 'package:movie_app/features/home/ui/home_screen.dart';
import 'package:movie_app/features/navbar/data/navbar_model.dart';
import 'package:movie_app/features/navbar/logic/navigation_states.dart';
import 'package:movie_app/features/profile/logic/profile_cubit.dart';
import 'package:movie_app/features/profile/ui/profile_screen.dart';
import 'package:movie_app/features/saved/logic/saved_cubit.dart';
import 'package:movie_app/features/saved/ui/saved_screen.dart';
import 'package:movie_app/features/search/logic/search_cubit.dart';
import 'package:movie_app/features/search/ui/search_screen.dart';

class NavigationBarCubit extends Cubit<NavigationStates> {
  NavigationBarCubit() : super(NavigationInitialState());

  List<NavbarModel> screens = [
    NavbarModel(
      icon: IconlyLight.home,
      index: 0,
      screen: BlocProvider(
        create: (context) => getIt<HomeCubit>()
          ..getTrendingMovies()
          ..getPopularMovies()
          ..getTopRatedMovies()
          ..getUpcomingMovies()
          ..getNowPlayingMovies()
          ..getLatest()
          ..getCategories(),
        child: const HomeScreen(),
      ),
    ),
    NavbarModel(
      icon: IconlyLight.search,
      index: 1,
      screen: BlocProvider(
        create: (context) => getIt<SearchCubit>(),
        child: const SearchScreen(),
      ),
    ),
    NavbarModel(
      icon: IconlyLight.bookmark,
      index: 2,
      screen: BlocProvider(
        create: (context) => getIt<SavedCubit>(),
        child: const SavedScreen(),
      ),
    ),
    NavbarModel(
      icon: IconlyLight.download,
      index: 3,
      screen: BlocProvider(
        create: (context) => getIt<DownloadsCubit>(),
        child: const DownloadsScreen(),
      ),
    ),
    NavbarModel(
      icon: IconlyLight.profile,
      index: 4,
      screen: BlocProvider(
        create: (context) => getIt<ProfileCubit>(),
        child: const ProfileScreen(),
      ),
    ),
  ];

  int bottomNavIndex = 0;

  void changeIndexInBottomNav(int index) {
    bottomNavIndex = index;
    emit(ChangeBottomNavState());
  }
}
