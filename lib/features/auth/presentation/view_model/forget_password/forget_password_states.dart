abstract class ForgetPasswordStates{}

class ForgetPasswordInitState extends ForgetPasswordStates{}
class ForgetPasswordLoadingState extends ForgetPasswordStates{}
class ForgetPasswordErrorState extends ForgetPasswordStates{
  final String error;

  ForgetPasswordErrorState(this.error);
}
class ForgetPasswordSuccessState extends ForgetPasswordStates{}