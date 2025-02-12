import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';
import 'package:movie_app/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(InitHomeState());

  void getTrendingMovies() async {
    emit(LoadingTrending());
    final response = await _homeRepo.getTrendingMovies();
    response.fold((error) {
      emit(ErrorTrending(error: error.message ?? 'Failure'));
    }, (moviesResponse) async {
      emit(SuccessTrending(moviesResponse: moviesResponse));
    });
  }

  void getPopularMovies() async {
    emit(LoadingPopular());
    final response = await _homeRepo.getPopularMovies();
    response.fold((error) {
      emit(ErrorPopular(error: error.message ?? 'Failure'));
    }, (moviesResponse) async {
      emit(SuccessPopular(moviesResponse: moviesResponse));
    });
  }

  void getTopRatedMovies() async {
    emit(LoadingTopRated());
    final response = await _homeRepo.getTopRatedMovies();
    response.fold((error) {
      emit(ErrorTopRated(error: error.message ?? 'Failure'));
    }, (moviesResponse) async {
      emit(SuccessTopRated(moviesResponse: moviesResponse));
    });
  }

  void getUpcomingMovies() async {
    emit(LoadingUpcoming());
    final response = await _homeRepo.getUpcomingMovies();
    response.fold((error) {
      emit(ErrorUpcoming(error: error.message ?? 'Failure'));
    }, (moviesResponse) async {
      emit(SuccessUpcoming(moviesResponse: moviesResponse));
    });
  }

  void getNowPlayingMovies() async {
    emit(LoadingNowPlaying());
    final response = await _homeRepo.getNowPlayingMovies();
    response.fold((error) {
      emit(ErrorNowPlaying(error: error.message ?? 'Failure'));
    }, (moviesResponse) async {
      emit(SuccessNowPlaying(moviesResponse: moviesResponse));
    });
  }

  void getLatest() async {
    emit(LoadingLatest());
    final response = await _homeRepo.getLatest();
    response.fold((error) {
      emit(ErrorLatest(error: error.message ?? 'Failure'));
    }, (moviesResponse) async {
      emit(SuccessLatest(moviesResponse: moviesResponse));
    });
  }

  void getCategories() async {
    emit(LoadingCategories());
    final response = await _homeRepo.getCategories();
    response.fold((error) {
      emit(ErrorCategories(error: error.message ?? 'Failure'));
    }, (categories) async {
      emit(SuccessCategories(categories: categories));
    });
  }
}
