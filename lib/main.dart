// ignore_for_file: avoid_print

import 'dart:async';

import 'package:code_me/common/code_me_app.dart';

import 'package:flutter/material.dart';
import 'di/di.dart' as getit;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getit.dInit());
  //dynamic id=0;
  // CompileRequestModel lanmodel = CompileRequestModel(
  //     language: 'python', code: 'print("Hello World!")', input: '', save: true);

  // CompileUsease getcompileUsease = getit.instance<CompileUsease>();
  // GetOutputUsecase getOutputUsease = getit.instance<GetOutputUsecase>();

  // Either<AppError, CompileResponseModel> eitherResponse =
  //     await getcompileUsease(CompileParms(value: lanmodel));

  // eitherResponse.fold((l) {
  //   print('an errory occured');
  //   print(l);
  // }, (r) {
  //   print('all is ok');
  //   print(r.status);
  //   // id = r.submissionId;
  // });

  // Either<AppError, CompileOutputModel> eitherOutput = await getOutputUsease(
  //     const OutputParams(submissionid: '6b196841-06c1-46ce-b225-852ce654d4f8'));

  // eitherOutput.fold((l) {
  //   print('an errory occured');
  //   print(l);
  // }, (r) {
  //   print('Output');
  //   print(r.output);
  // });

  runApp(const CodeMeApp());
}
