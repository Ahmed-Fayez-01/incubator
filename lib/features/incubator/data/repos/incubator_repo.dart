import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class IncubatorRepo{
  Future<Either<Failure,bool>> addCase({required Map<String,dynamic> data});
}