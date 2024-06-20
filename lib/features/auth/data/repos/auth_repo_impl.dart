import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:incubator/features/cases/data/models/cases_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/remote/api_service.dart';
import '../../../../core/services/remote/endpoints.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService? apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, bool>> register({required Map<String, dynamic> data}) async {
    try {
      var response = await apiService!.postData(endPoint: EndPoints.register, data: data);
      print(response.data);
      bool result = response.data != null ? true : false;
      return right(result);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> login({required Map<String, dynamic> data}) async {
    try {
      var response = await apiService!.postData(endPoint: EndPoints.login, data: data);
      String result = response.data["data"]["token"];
      return right(result);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  @override
  Future<Either<Failure, String>> forgetPassword({required String email}) async {
    try {
      var response = await apiService!.postData(endPoint: EndPoints.forgotPassword, data: {
        "email":email
      });
      String result = response.data["message"];
      return right(result);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  @override
  Future<Either<Failure, String>> sendCode({required String otp}) async {
    try {
      var response = await apiService!.postData(endPoint: EndPoints.verifyResetCode, data: {
        "resetCode":otp
      });
      String result = response.data["status"];
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
