abstract class AddCaseStates{}

class AddCaseInitState extends AddCaseStates{}
class AddCaseLoadingState extends AddCaseStates{}
class AddCaseErrorState extends AddCaseStates{
  final String error;

  AddCaseErrorState(this.error);
}
class AddCaseSuccessState extends AddCaseStates{}