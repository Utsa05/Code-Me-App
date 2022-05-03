// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:code_me/common/constants/translation_constants.dart';
import 'package:code_me/data/models/compile_output_model.dart';
import 'package:code_me/domain/entities/app_error.dart';
import 'package:code_me/domain/entities/output_param.dart';
import 'package:code_me/domain/usecases/get_output_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'output_state.dart';

class OutputCubit extends Cubit<OutputState> {
  OutputCubit(this.getOutputUsecase) : super(OutputInitial());
  final GetOutputUsecase getOutputUsecase;

  void getOutputResponse(dynamic sid) async {
    emit(OuputLoading());
    final Either<AppError, CompileOutputModel> eitherResponse =
        await getOutputUsecase(OutputParams(submissionid: sid));

    emit(eitherResponse.fold((l) {
      var message = getErrorMessage(l.appErrorType);

      print(message);
      return OutputErrorState(message);
    }, (r) {
      print(r.code);

      return OutputResponseS(r);
    }));
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
