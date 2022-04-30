import 'package:code_me/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class Usecase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
