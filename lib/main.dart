// ignore_for_file: avoid_print

import 'package:code_me/common/code_me_app.dart';
import 'package:code_me/data/core/api_client.dart';
import 'package:code_me/data/datasources/compiler_remote_datasource.dart';
import 'package:code_me/data/models/compile_output_model.dart';
import 'package:code_me/data/models/compile_request_model.dart';
import 'package:code_me/data/models/compile_response_model.dart';
import 'package:code_me/data/repositories/compiler_repository_impl.dart';
import 'package:code_me/domain/entities/app_error.dart';
import 'package:code_me/domain/entities/compile_parms.dart';
import 'package:code_me/domain/entities/output_param.dart';
import 'package:code_me/domain/repositories/compiler_repository.dart';
import 'package:code_me/domain/usecases/compile_usecase.dart';
import 'package:code_me/domain/usecases/get_output_usecase.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dynamic id;
  CompileRequestModel lanmodel = CompileRequestModel(
      language: 'python', code: 'print("Hello World!")', input: '', save: true);
  ApiClient apiClient = ApiClient(Client());
  CompileRemoteDataSource dataSource = CompileRemoteDatasourceImpl(apiClient);

  CompilerRepository repository =
      CompilerRepositoryImpl(dataSource: dataSource);

  CompileUsease getcompileUsease =
      CompileUsease(compilerRepository: repository);
  GetOutputUsecase getOutputUsease =
      GetOutputUsecase(compilerRepository: repository);

  Either<AppError, CompileResponseModel> eitherResponse =
      await getcompileUsease(CompileParms(value: lanmodel));

  eitherResponse.fold((l) {
    print('an errory occured');
    print(l);
  }, (r) {
    print('all is ok');
    print(r.status);
    id = r.submissionId;
  });

  Either<AppError, CompileOutputModel> eitherOutput = await getOutputUsease(
      const OutputParams(submissionid: '6b196841-06c1-46ce-b225-852ce654d4f8'));

  eitherOutput.fold((l) {
    print('an errory occured');
    print(l);
  }, (r) {
    print('Output');
    print(r.output);
  });

  runApp(const CodeMeApp());
}
