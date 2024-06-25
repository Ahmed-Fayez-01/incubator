import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubator/features/cases/presentation/view_models/send_file/send_file_states.dart';

import '../../../data/repos/cases_repo.dart';

class SendFileCubit extends Cubit<SendFileStates> {
  SendFileCubit(this.caseRepo) : super(SendFileInitState());

  CaseRepo? caseRepo;

  sendFile({required String caseId,required File file}) async {
    emit(SendFileLoadingState());
    var result = await caseRepo!.sendFile(file: file,caseId:caseId);
    return result.fold((failure) {
      print("FFFFFFFFFFFFFFFFFf${failure.errMessage}");
      emit(SendFileErrorState(failure.errMessage));
    }, (data) {
      emit(SendFileSuccessState());
    });
  }
}
