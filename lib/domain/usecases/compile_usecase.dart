import 'package:code_me/data/models/compile_request_model.dart';
import 'package:code_me/data/models/compile_response_model.dart';
import 'package:code_me/domain/entities/app_error.dart';
import 'package:code_me/domain/entities/compile_parms.dart';
import 'package:code_me/domain/repositories/compiler_repository.dart';
import 'package:code_me/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class CompileUsease extends Usecase<CompileResponseModel, CompileParms> {
  final CompilerRepository compilerRepository;

  CompileUsease({required this.compilerRepository});
  @override
  Future<Either<AppError, CompileResponseModel>> call(params) async {
    return await compilerRepository.requestCompile(params.value);
  }
}
