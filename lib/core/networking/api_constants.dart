class ApiConstants {
  static const String apiBaseUrl = "https://api.themoviedb.org/3";

  static const String login = "auth/login";
  static const String signup = "auth/register";
  static const String apiKey = "cec1cbda3f6888a454328be3b08fb0ce";

  static const String aPIReadAccessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZWMxY2JkYTNmNjg4OGE0NTQzMjhiZTNiMDhmYjBjZSIsIm5iZiI6MTczNzkwNjM4OS4zNywic3ViIjoiNjc5NjU4ZDUwYTMwZDZkMDU5MjNmNjk4Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.hQaYbxyzqs7hX71lB-qlcepMlxsGL5XsQVfb-QPO1jw";
  static const String categories = '/genre/movie/list';
  static const String testAcc = '/account/21726713';
  static const String explore = '/discover/movie';
  static const String trending = '/trending/movie/week';
  static const String upcoming = '/movie/upcoming';
  static const String topRated = '/movie/top_rated';
  static const String popular = '/movie/popular';
  static const String nowPlaying = '/movie/now_playing';
  static const String latest = '/movie/latest';
  static const String movie = '/movie';
  static const String rating = '/rating';
  static const String search = '/search/movie';
  static const String recommendations = '/recommendations';
  static const String similar = '/similar';
  static const String guestSession = '/authentication/guest_session/new';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
