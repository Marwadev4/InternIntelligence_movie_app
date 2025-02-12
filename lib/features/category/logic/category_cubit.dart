import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/category/data/repos/category_repo.dart';
import 'package:movie_app/features/category/logic/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo _categoryRepo;
  CategoryCubit(this._categoryRepo) : super(InitCategoryState());

  void getCategoryMovies(int categoryId) async {
    emit(LoadingCategoryMovies());
    final response = await _categoryRepo.getCategoryMovies(categoryId);
    response.fold((error) {
      emit(ErrorCategoryMovies(error: error.message ?? 'Failure'));
    }, (moviesResponse) async {
      emit(SuccessCategoryMovies(moviesResponse: moviesResponse));
    });
  }
}
