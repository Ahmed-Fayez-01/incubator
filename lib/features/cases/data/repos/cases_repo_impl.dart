import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:incubator/features/cases/data/models/cases_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/remote/api_service.dart';
import '../../../../core/services/remote/endpoints.dart';
import 'cases_repo.dart';

class CaseRepoImpl implements CaseRepo {
  final ApiService? apiService;

  CaseRepoImpl(this.apiService);


  @override
  Future<Either<Failure, CasesModel>> getAllCases() async {
    try {
      var response = await apiService!.get(
          endPoint: EndPoints.getAllCases,
          sendToken:  true
      );
      var result = CasesModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}
