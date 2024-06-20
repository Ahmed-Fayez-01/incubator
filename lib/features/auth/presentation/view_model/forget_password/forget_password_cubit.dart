import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubator/core/services/local/cache_helper/cache_helper.dart';
import 'package:incubator/features/auth/data/repos/auth_repo.dart';
import 'package:incubator/features/auth/presentation/view_model/forget_password/forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitState());

  AuthRepo? authRepo;

  forgetPassword({required String email}) async {
    emit(ForgetPasswordLoadingState());
    var result = await authRepo!.forgetPassword(email: email);
    return result.fold((failure) {
      emit(ForgetPasswordErrorState(failure.errMessage));
    }, (data) {
      emit(ForgetPasswordSuccessState());
    });
  }
}
