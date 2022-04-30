import 'dart:io';

import 'package:code_me/data/datasources/compiler_remote_datasource.dart';
import 'package:code_me/domain/entities/app_error.dart';
import 'package:code_me/data/models/compile_response_model.dart';
import 'package:code_me/data/models/compile_request_model.dart';
import 'package:code_me/data/models/compile_output_model.dart';
import 'package:code_me/domain/repositories/compiler_repository.dart';
import 'package:dartz/dartz.dart';

class CompilerRepositoryImpl implements CompilerRepository {
  final CompileRemoteDataSource dataSource;

  CompilerRepositoryImpl({required this.dataSource});
  @override
  Future<Either<AppError, CompileOutputModel>> getOutput(submissionid) async {
    try {
      final output = await dataSource.getOutput(submissionid);
      return Right(output);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, CompileResponseModel>> requestCompile(
      CompileRequestModel requestModel) async {
    try {
      final response = await dataSource.requestCompile(requestModel);
      return Right(response);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }
}
