import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubator/core/utils/constants.dart';

import '../../../data/models/cases_model.dart';
import '../../../data/repos/cases_repo.dart';


part 'get_all_cases_state.dart';

class GetAllCasesCubit extends Cubit<GetAllCasesState> {
  GetAllCasesCubit(this.caseRepo) : super(GetAllCasesInitial());
  static GetAllCasesCubit get(context) => BlocProvider.of(context);
  CaseRepo? caseRepo;
  Future<void> getAllCases() async {
    emit(UserGetAllCasesLoadingState());
    var result = await caseRepo!.getAllCases();
    return result.fold((failure) {
      emit(UserGetAllCasesErrorState(failure.errMessage));
    }, (data) {
      AppConstant.model=[];
      for(var item in data.data!.cases!)
        {
          AppConstant.model.add(item);
        }
      AppConstant.foundedItems=AppConstant.model;

      emit(UserGetAllCasesSuccessState(data));
    });
  }
}
