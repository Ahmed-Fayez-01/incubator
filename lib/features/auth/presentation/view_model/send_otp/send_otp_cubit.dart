import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubator/features/auth/data/repos/auth_repo.dart';
import 'package:incubator/features/auth/presentation/view_model/send_otp/send_otp_states.dart';

class SendOtpCubit extends Cubit<SendOtpStates> {
  SendOtpCubit(this.authRepo) : super(SendOtpInitState());

  AuthRepo? authRepo;

  sendOtp({required String otp}) async {
    emit(SendOtpLoadingState());
    var result = await authRepo!.sendCode(otp: otp);
    return result.fold((failure) {
      emit(SendOtpErrorState(failure.errMessage));
    }, (data) {
      emit(SendOtpSuccessState());
    });
  }
}
