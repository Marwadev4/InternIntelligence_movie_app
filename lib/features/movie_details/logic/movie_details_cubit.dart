import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_details/data/models/rating_request_body.dart';
import 'package:movie_app/features/movie_details/data/repos/movie_details_repo.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsRepo _movieDetailsRepo;
  MovieDetailsCubit(this._movieDetailsRepo) : super(InitMovieDetailsState());

  void getMovieDetails(int movieId) async {
    emit(LoadingMovieDetails());
    final response = await _movieDetailsRepo.getMovieDetails(movieId);
    response.fold((error) {
      emit(ErrorMovieDetails(error: error.message ?? 'Failure'));
    }, (movieDetailsResponse) async {
      emit(SuccessMovieDetails(movieDetailsResponse: movieDetailsResponse));
    });
  }

  void getMovieRecommendations(int movieId) async {
    emit(LoadingMovieRecommendations());
    final response = await _movieDetailsRepo.getMovieRecommendations(movieId);
    response.fold((error) {
      emit(ErrorMovieRecommendations(error: error.message ?? 'Failure'));
    }, (moviesResponse) async {
      emit(SuccessMovieRecommendations(moviesResponse: moviesResponse));
    });
  }

  void getMovieSimilar(int movieId) async {
    emit(LoadingMovieSimilar());
    final response = await _movieDetailsRepo.getMovieSimilar(movieId);
    response.fold((error) {
      emit(ErrorMovieSimilar(error: error.message ?? 'Failure'));
    }, (moviesResponse) async {
      emit(SuccessMovieSimilar(moviesResponse: moviesResponse));
    });
  }

  double ratingValue = 0.0;

  void ratingMovie(int movieId) async {
    emit(LoadingRatingMovie());
    final response = await _movieDetailsRepo.ratingMovie(
      movieId: movieId,
      rating: RatingRequestBody(value: ratingValue),
    );
    response.fold((error) {
      emit(ErrorRatingMovie(error: error.message ?? 'Failure'));
    }, (ratingResponse) async {
      emit(SuccessRatingMovie(ratingResponse: ratingResponse));
    });
  }
}
