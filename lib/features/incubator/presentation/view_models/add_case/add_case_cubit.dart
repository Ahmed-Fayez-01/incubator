import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubator/features/incubator/data/repos/incubator_repo.dart';

import 'add_case_states.dart';

class AddCaseCubit extends Cubit<AddCaseStates> {
  AddCaseCubit(this.incubatorRepo) : super(AddCaseInitState());

  IncubatorRepo? incubatorRepo;

  addCase({required Map<String, dynamic> data}) async {
    emit(AddCaseLoadingState());
    var result = await incubatorRepo!.addCase(data: data);
    return result.fold((failure) {
      emit(AddCaseErrorState(failure.errMessage));
    }, (data) {
      emit(AddCaseSuccessState());
    });
  }
}
