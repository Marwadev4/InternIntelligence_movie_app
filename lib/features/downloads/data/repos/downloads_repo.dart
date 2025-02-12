import 'package:movie_app/core/networking/api_service.dart';

class DownloadsRepo {
  final ApiService _apiService;

  DownloadsRepo(this._apiService);

  // Future<Either<ApiErrorModel, List<TabCategoryResponse>>> getSpecialization() async {
  //   try {
  //     final response = await _apiService.getSpecialization();
  //     return right(response);
  //   } catch (error) {
  //     return left(ApiErrorHandler.handle(error));
  //   }
  // }
}
