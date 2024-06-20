import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class AuthRepo{
  Future<Either<Failure,bool>> register({required Map<String,dynamic> data});
  Future<Either<Failure,String>> login({required Map<String,dynamic> data});
  Future<Either<Failure,String>> forgetPassword({required String email});
  Future<Either<Failure,String>> sendCode({required String otp});
  // Future<Either<Failure,String>> resetPassword({required Map<String,dynamic> data});
}