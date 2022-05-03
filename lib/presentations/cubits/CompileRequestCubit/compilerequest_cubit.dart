// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_me/common/constants/translation_constants.dart';
import 'package:code_me/data/models/compile_output_model.dart';
import 'package:code_me/data/models/compile_request_model.dart';
import 'package:code_me/data/models/compile_response_model.dart';
import 'package:code_me/domain/entities/app_error.dart';
import 'package:code_me/domain/entities/compile_parms.dart';
import 'package:code_me/domain/entities/output_param.dart';
import 'package:code_me/domain/usecases/compile_usecase.dart';
import 'package:code_me/domain/usecases/get_output_usecase.dart';
import 'package:code_me/presentations/cubits/loadingCubit/loading_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'compilerequest_state.dart';

class CompilerequestCubit extends Cubit<CompilerequestState> {
  CompilerequestCubit(
      this.compileUsease, this.loadingCubit, this.getOutputUsecase)
      : super(CompilerequestInitial());
  final CompileUsease compileUsease;
  final GetOutputUsecase getOutputUsecase;
  final LoadingCubit loadingCubit;

  CompileResponseModel getCompileResponse(CompileResponseModel response) {
    print(response.submissionId);
    return response;
  }

  void initiateCompileRequest(CompileRequestModel cmodel) async {
    late CompileResponseModel response;
    emit(CompilerequestLoading());
    loadingCubit.show();
    final Either<AppError, CompileResponseModel> eitherResponse =
        await compileUsease(CompileParms(value: cmodel));

    emit(eitherResponse.fold((l) {
      var message = getErrorMessage(l.appErrorType);

      print(message);
      return CompileError(message);
    }, (r) {
      print(r.submissionId);
      response = r;
      getCompileResponse(r);
      return CompileResponse(r);
    }));

    emit(CompilerequestLoading());

    Timer(const Duration(seconds: 3), () async {
      final Either<AppError, CompileOutputModel> eitherRespons =
          await getOutputUsecase(
              OutputParams(submissionid: response.submissionId));
      emit(eitherRespons.fold((l) {
        var message = getErrorMessage(l.appErrorType);

        print(message);
        return OutputError(message);
      }, (r) {
        print(r.code);

        return OutputResponseStage(r);
      }));
    });

    loadingCubit.hide();
  }

  String getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      case AppErrorType.network:
        return TranslationConstants.noNetwork;
      case AppErrorType.api:

      default:
        return TranslationConstants.serverProblem;
    }
  }
}
