import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubator/core/services/local/cache_helper/cache_helper.dart';
import 'package:incubator/features/auth/data/repos/auth_repo.dart';
import 'package:incubator/features/auth/presentation/view_model/login/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.authRepo) : super(LoginInitState());

  AuthRepo? authRepo;

  login({required Map<String, dynamic> data}) async {
    emit(LoginLoadingState());
    var result = await authRepo!.login(data: data);
    return result.fold((failure) {
      emit(LoginErrorState(failure.errMessage));
    }, (data) {
      CacheHelper.saveData(key: "token", value: data);
      emit(LoginSuccessState());
    });
  }
}
