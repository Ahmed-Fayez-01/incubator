import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:incubator/features/cases/data/models/cases_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/remote/api_service.dart';
import '../../../../core/services/remote/endpoints.dart';
import 'cases_repo.dart';
import 'package:path/path.dart';

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

  @override
  Future<Either<Failure, bool>> sendFile({required file,required caseId}) async{
    try {
      var response = await apiService!.postData(
          endPoint: EndPoints.report,
          sendToken:  true,
        data: FormData.fromMap({
          "caseId":"66105e6a7522d3245233227d",
          "report": await MultipartFile.fromFile(file.path, filename: basename(file.path)),
        })

      );
      bool result = response.data != null ? true : false;
      return right(result);
    } catch (e) {
      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD"+e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}
