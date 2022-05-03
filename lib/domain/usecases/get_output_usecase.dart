import 'package:code_me/data/models/compile_output_model.dart';
import 'package:code_me/domain/entities/app_error.dart';
import 'package:code_me/domain/entities/output_param.dart';
import 'package:code_me/domain/repositories/compiler_repository.dart';
import 'package:code_me/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetOutputUsecase extends Usecase<CompileOutputModel, OutputParams> {
  final CompilerRepository compilerRepository;

  GetOutputUsecase({required this.compilerRepository});
  @override
  Future<Either<AppError, CompileOutputModel>> call(params) async {
    return await compilerRepository.getOutput(params.submissionid);
  }
}
