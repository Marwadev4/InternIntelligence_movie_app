import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_conf.dart';
import 'package:movie_app/core/networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.apiBaseUrl,
          receiveDataWhenStatusError: true,
        ),
      );
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
    };
    String apiKey = ApiConf.apiKey;
    return await dio!.get(
      "$endPoint?api_key=$apiKey",
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> getDataUseToken({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    String token = ApiConf.token;
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    String apiKey = ApiConf.apiKey;

    return await dio!.get(
      "$endPoint?api_key=$apiKey",
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic>? data,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
    };

    String apiKey = ApiConf.apiKey;
    return dio!.post(
      "$endPoint?api_key=$apiKey",
      data: data,
    );
  }

  static Future<Response> postDataUseToken({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    String token = ApiConf.token;
    dio?.options.headers = {
      'Content-Type': 'application/json;charset=utf-8',
      'Authorization': 'Bearer $token',
    };
    String apiKey = ApiConf.apiKey;
    return await dio!.post(
      "$endPoint?api_key=$apiKey",
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchUserImageUseToken({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? image,
  }) async {
    String token = ApiConf.token;
    dio?.options.headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    };
    String apiKey = ApiConf.apiKey;
    return dio!.patch(
      "$endPoint?api_key=$apiKey",
      queryParameters: query,
      data: image,
    );
  }

  static Future<Response> putDataUseToken({
    required String endPoint,
    required Object? data,
  }) async {
    String token = ApiConf.token;
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    String apiKey = ApiConf.apiKey;
    return dio!.put(
      "$endPoint?api_key=$apiKey",
      data: data,
    );
  }

  static Future<Response> deleteDataUseToken({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    String token = ApiConf.token;
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    String apiKey = ApiConf.apiKey;
    return dio!.delete(
      "$endPoint?api_key=$apiKey",
      queryParameters: query,
    );
  }

  static Future<Response> patchDataUseToken({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
  }) async {
    String token = ApiConf.token;
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    String apiKey = ApiConf.apiKey;
    return dio!.patch(
      "$endPoint?api_key=$apiKey",
      queryParameters: query,
      data: data,
    );
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
