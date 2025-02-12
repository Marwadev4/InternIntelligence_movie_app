import 'package:dio/dio.dart';
import 'package:movie_app/core/helpers/constants.dart';
import 'package:movie_app/core/models/category_response.dart';
import 'package:movie_app/core/models/movies_response.dart';
import 'package:movie_app/core/networking/api_constants.dart';
import 'package:movie_app/core/networking/dio_factory.dart';
import 'package:movie_app/features/login/data/models/login_response.dart';
import 'package:movie_app/features/movie_details/data/models/movie_details_response.dart';
import 'package:movie_app/features/movie_details/data/models/rating_request_body.dart';
import 'package:movie_app/features/movie_details/data/models/rating_response.dart';
import 'package:movie_app/features/search/data/models/search_requset_body.dart';

class ApiService {
  final Dio dio;
  const ApiService(this.dio);

  Future<MoviesResponse> getTrending() async {
    var response = await DioFactory.getData(
      endPoint: ApiConstants.trending,
    );
    MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
    return moviesResponse;
  }

  Future<MoviesResponse> getPopular() async {
    var response = await DioFactory.getData(
      endPoint: ApiConstants.popular,
    );
    MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
    return moviesResponse;
  }

  Future<MoviesResponse> getTopRated() async {
    var response = await DioFactory.getData(
      endPoint: ApiConstants.topRated,
    );
    MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
    return moviesResponse;
  }

  Future<MoviesResponse> getUpcoming() async {
    var response = await DioFactory.getData(
      endPoint: ApiConstants.upcoming,
    );
    MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
    return moviesResponse;
  }

  Future<MoviesResponse> getNowPlaying() async {
    var response = await DioFactory.getData(
      endPoint: ApiConstants.nowPlaying,
    );
    MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
    return moviesResponse;
  }

  Future<MoviesResponse> getLatest() async {
    var response = await DioFactory.getData(
      endPoint: ApiConstants.latest,
    );
    MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
    return moviesResponse;
  }

  Future<List<CategoryResponse>> getCategories() async {
    List<CategoryResponse> categories = [];
    var response = await DioFactory.getData(
      endPoint: ApiConstants.categories,
    );
    for (var category in response.data['genres']) {
      categories.add(CategoryResponse.fromJson(category));
    }
    return categories;
  }

  Future<MoviesResponse> getCategoryMovies(int categoryId) async {
    var response =
        await DioFactory.getData(endPoint: ApiConstants.explore, query: {
      'with_genres': categoryId,
    });
    MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
    return moviesResponse;
  }

  Future<MovieDetailsResponse> getMovieDetails(int movieId) async {
    var response = await DioFactory.getData(
      endPoint: "${ApiConstants.movie}/$movieId",
    );
    MovieDetailsResponse movieDetailsResponse =
        MovieDetailsResponse.fromJson(response.data);
    return movieDetailsResponse;
  }

  Future<MoviesResponse> getMovieSimilar(int movieId) async {
    var response = await DioFactory.getData(
      endPoint: "${ApiConstants.movie}/$movieId${ApiConstants.similar}",
    );
    MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
    return moviesResponse;
  }

  Future<MoviesResponse> getMovieRecommendations(int movieId) async {
    var response = await DioFactory.getData(
      endPoint: "${ApiConstants.movie}/$movieId${ApiConstants.recommendations}",
    );
    MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
    return moviesResponse;
  }

  Future<LoginResponse> createGuestSession() async {
    var response = await DioFactory.getDataUseToken(
      endPoint: ApiConstants.guestSession,
    );
    return LoginResponse.fromJson(response.data);
  }

  Future<RatingResponse> ratingMovie({
    required RatingRequestBody rating,
    required int movieId,
  }) async {
    var response = await DioFactory.postDataUseToken(
      endPoint: "${ApiConstants.movie}/$movieId${ApiConstants.rating}",
      data: rating.toJson(),
      query: {
        'guest_session_id': guestSessionId,
      },
    );
    return RatingResponse.fromJson(response.data);
  }

  Future<MoviesResponse> searchMovie(SearchRequestBody search) async {
    var response = await DioFactory.getData(
      endPoint: ApiConstants.search,
      query: search.toJson(),
    );
    MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
    return moviesResponse;
  }
}
