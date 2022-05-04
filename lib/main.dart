// ignore_for_file: avoid_print

import 'dart:async';

import 'package:code_me/common/code_me_app.dart';
import 'package:code_me/domain/entities/app_error.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/domain/entities/local_db_param.dart';
import 'package:code_me/domain/entities/no_parms.dart';
import 'package:code_me/domain/usecases/get_languages_usecase.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';
import 'di/di.dart' as getit;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getit.dInit());
  //dynamic id=0;
  // CompileRequestModel lanmodel = CompileRequestModel(
  //     language: 'python', code: 'print("Hello World!")', input: '', save: true);

  LanguageItemEntity entity = const LanguageItemEntity(
      id: 12112,
      title: 'my title',
      imageAssets: 'assets',
      language: 'lange',
      type: 'type',
      code: 'code');

  GetLanguageUsecase getLanguageUsecase = getit.instance<GetLanguageUsecase>();
  Either<AppError, List<LanguageItemEntity>> eitherResponse =
      await getLanguageUsecase(NoParms());

  eitherResponse.fold((l) {
    print(l.appErrorType);
  }, (r) {
    for (var item in r) {
      print(item.language);
    }
  });

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
