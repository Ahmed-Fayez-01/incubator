import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:incubator/features/cases/data/repos/cases_repo_impl.dart';
import 'api_service.dart';
//dependency Injection

final  getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<CaseRepoImpl>(CaseRepoImpl(
    getIt.get<ApiService>(),
  ));
}