import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/downloads/data/repos/downloads_repo.dart';
import 'package:movie_app/features/downloads/logic/downloads_state.dart';

class DownloadsCubit extends Cubit<DownloadsState> {
  final DownloadsRepo _downloadsRepo;
  DownloadsCubit(this._downloadsRepo) : super(InitState());

  // List<SpecializationsData?>? specializationsList = [];

  // void getSpecializations() async {
  //   emit(const DownloadsState.specializationsLoading());
  //   final response = await _homeRepo.getSpecialization();
  //   response.when(
  //     success: (specializationsResponseModel) {
  //       specializationsList =
  //           specializationsResponseModel.specializationDataList ?? [];
  //       emit(DownloadsState.specializationsSuccess(
  //           specializationsResponseModel.specializationDataList));
  //     },
  //     failure: (apiErrorModel) {
  //       emit(DownloadsState.specializationsError(apiErrorModel));
  //     },
  //   );
  // }
}
