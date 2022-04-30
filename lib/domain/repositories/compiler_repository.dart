import 'package:code_me/data/models/compile_output_model.dart';
import 'package:code_me/data/models/compile_request_model.dart';
import 'package:code_me/data/models/compile_response_model.dart';
import 'package:code_me/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class CompilerRepository {
  Future<Either<AppError, CompileResponseModel>> requestCompile(
      CompileRequestModel requestModel);

  Future<Either<AppError, CompileOutputModel>> getOutput(dynamic submissionid);
}
