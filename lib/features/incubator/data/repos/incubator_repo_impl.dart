import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/remote/api_service.dart';
import '../../../../core/services/remote/endpoints.dart';
import 'incubator_repo.dart';

class IncubatorRepoImpl implements IncubatorRepo {
  final ApiService? apiService;

  IncubatorRepoImpl(this.apiService);

  @override
  Future<Either<Failure, bool>> addCase({required Map<String, dynamic> data}) async{
    try {
      var response = await apiService!.postData(endPoint: EndPoints.getAllCases, data: data,sendToken: true);
      bool result = response.data != null ? true : false;
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
