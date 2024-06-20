import 'package:dartz/dartz.dart';
import 'package:incubator/features/cases/data/models/cases_model.dart';

import '../../../../core/errors/failure.dart';

abstract class CaseRepo{
  Future<Either<Failure,CasesModel>> getAllCases();
}