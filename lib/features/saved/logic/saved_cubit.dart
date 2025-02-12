import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/saved/data/repos/saved_repo.dart';
import 'package:movie_app/features/saved/logic/saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  final SavedRepo _savedRepo;
  SavedCubit(this._savedRepo) : super(InitState());

  // List<SpecializationsData?>? specializationsList = [];

  // void getSpecializations() async {
  //   emit(const SavedState.specializationsLoading());
  //   final response = await _homeRepo.getSpecialization();
  //   response.when(
  //     success: (specializationsResponseModel) {
  //       specializationsList =
  //           specializationsResponseModel.specializationDataList ?? [];
  //       emit(SavedState.specializationsSuccess(
  //           specializationsResponseModel.specializationDataList));
  //     },
  //     failure: (apiErrorModel) {
  //       emit(SavedState.specializationsError(apiErrorModel));
  //     },
  //   );
  // }
}
