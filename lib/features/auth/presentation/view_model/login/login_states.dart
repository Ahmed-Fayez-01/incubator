abstract class LoginStates{}

class LoginInitState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginErrorState extends LoginStates{
  final String error;

  LoginErrorState(this.error);
}
class LoginSuccessState extends LoginStates{}