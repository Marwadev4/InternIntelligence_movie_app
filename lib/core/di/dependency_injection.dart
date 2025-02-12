import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/networking/api_service.dart';
import 'package:movie_app/core/networking/dio_factory.dart';
import 'package:movie_app/features/category/data/repos/category_repo.dart';
import 'package:movie_app/features/category/logic/category_cubit.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';
import 'package:movie_app/features/home/logic/home_cubit.dart';
import 'package:movie_app/features/login/data/repos/login_repo.dart';
import 'package:movie_app/features/login/logic/login_cubit.dart';
import 'package:movie_app/features/movie_details/data/repos/movie_details_repo.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/navbar/logic/navigation_cubit.dart';
import 'package:movie_app/features/search/data/repos/search_repo.dart';
import 'package:movie_app/features/search/logic/search_cubit.dart';
import 'package:movie_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:movie_app/features/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

/// Dependency Injection
void setupDi() {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  // api
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // navbar
  getIt.registerFactory<NavigationBarCubit>(() => NavigationBarCubit());

  // home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  // category
  getIt.registerLazySingleton<CategoryRepo>(
      () => CategoryRepo(getIt<ApiService>()));
  getIt.registerFactory<CategoryCubit>(
      () => CategoryCubit(getIt<CategoryRepo>()));

  // movie details
  getIt.registerLazySingleton<MovieDetailsRepo>(
      () => MovieDetailsRepo(getIt<ApiService>()));
  getIt.registerFactory<MovieDetailsCubit>(
      () => MovieDetailsCubit(getIt<MovieDetailsRepo>()));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // signup
  getIt
      .registerLazySingleton<SignupRepo>(() => SignupRepo(getIt<ApiService>()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignupRepo>()));

  // search
  getIt
      .registerLazySingleton<SearchRepo>(() => SearchRepo(getIt<ApiService>()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<SearchRepo>()));
}
