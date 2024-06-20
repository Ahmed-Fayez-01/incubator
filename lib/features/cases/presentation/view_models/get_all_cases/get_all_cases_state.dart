part of 'get_all_cases_cubit.dart';

@immutable
abstract class GetAllCasesState {}

class GetAllCasesInitial extends GetAllCasesState {}
class UserGetAllCasesLoadingState extends GetAllCasesState {}
class SearchSuccess extends GetAllCasesState {}
class UserGetAllCasesSuccessState extends GetAllCasesState {
  CasesModel model;
  UserGetAllCasesSuccessState(this.model);
}
class UserGetAllCasesErrorState extends GetAllCasesState {
  final String errMessage;
  UserGetAllCasesErrorState(this.errMessage);
}
