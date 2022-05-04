// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:code_me/common/constants/translation_constants.dart';
import 'package:code_me/domain/entities/app_error.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/domain/entities/local_db_param.dart';
import 'package:code_me/domain/entities/no_parms.dart';
import 'package:code_me/domain/usecases/delete_usecase.dart';
import 'package:code_me/domain/usecases/get_languages_usecase.dart';
import 'package:code_me/domain/usecases/insert_usecase.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'local_cubit_state.dart';

class LocalCubitCubit extends Cubit<LocalCubitState> {
  LocalCubitCubit(
      this.getLanguageUsecase, this.deleteUsecase, this.insertUsecase)
      : super(LocalCubitInitial());
  final GetLanguageUsecase getLanguageUsecase;
  final InsertUsecase insertUsecase;
  final DeleteUsecase deleteUsecase;

  void fetchLanguages(String title) async {
    emit(LocalCubitLoadingState());
    final Either<AppError, List<LanguageItemEntity>> eitherResponse =
        await getLanguageUsecase(NoParms());

    emit(eitherResponse.fold((l) {
      var message = getErrorMessage(l.appErrorType);

      print(message);
      return LocalErrorState(message);
    }, (r) {
      r.where((item) {
        print(item.language);
        // if (item.title.toLowerCase().contains(title.toLowerCase())) {
        //   print(item.title);
        //   langeuseList.add(item);
        // }
        return true;
      });
      List<LanguageItemEntity> langeuseList = <LanguageItemEntity>[];
      langeuseList = r;

      if (title.contains('nosearch')) {
        return FetchedLanguageState(langeuseList);
      } else {
        emit(LocalCubitLoadingState());
        List<LanguageItemEntity> list = <LanguageItemEntity>[];
        for (var item in langeuseList) {
          if (item.title.toLowerCase().contains(title.toLowerCase())) {
            list.add(item);
          }
        }
        return FetchedLanguageState(list);
      }
    }));
  }

  void deleteItem(LanguageItemEntity entity) async {
    emit(LocalCubitLoadingState());
    final Either<AppError, LanguageItemEntity> eitherResponse =
        await deleteUsecase(LocalDBParms(entity));

    emit(eitherResponse.fold((l) {
      var message = getErrorMessage(l.appErrorType);

      print(message);
      return LocalErrorState(message);
    }, (r) {
      return LocalCubitSuccessState();
    }));
  }

  void insertItem(LanguageItemEntity entity) async {
    emit(LocalCubitLoadingState());
    final Either<AppError, LanguageItemEntity> eitherResponse =
        await insertUsecase(LocalDBParms(entity));

    emit(eitherResponse.fold((l) {
      var message = getErrorMessage(l.appErrorType);

      print(message);
      return LocalErrorState(message);
    }, (r) {
      return LocalCubitSuccessState();
    }));
  }
}

String getErrorMessage(AppErrorType appErrorType) {
  switch (appErrorType) {
    case AppErrorType.localdb:
      return TranslationConstants.lacaldbError;

    default:
      return TranslationConstants.serverProblem;
  }
}
