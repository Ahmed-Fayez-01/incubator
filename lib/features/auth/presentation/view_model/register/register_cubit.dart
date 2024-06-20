import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubator/features/auth/data/repos/auth_repo.dart';
import 'package:incubator/features/auth/presentation/view_model/register/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.authRepo) : super(RegisterInitState());

  AuthRepo? authRepo;

  register({required Map<String, dynamic> data}) async {
    emit(RegisterLoadingState());
    print("looooo");
    var result = await authRepo!.register(data: data);
    return result.fold((failure) {
      print("errrror");
      emit(RegisterErrorState(failure.errMessage));
    }, (data) {
      print("suuuuu");

      emit(RegisterSuccessState());
    });
  }
}
