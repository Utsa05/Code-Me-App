import 'package:code_me/data/datasources/local_datasource/local_datasource.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/domain/entities/app_error.dart';
import 'package:code_me/domain/repositories/localdb_repository.dart';
import 'package:dartz/dartz.dart';

class LocaldbRepositoryImpl implements LocalDBRepository {
  final LocalDatasource datasource;

  LocaldbRepositoryImpl(this.datasource);
  @override
  Future<Either<AppError, LanguageItemEntity>> deleteItem(
      LanguageItemEntity languageItemEntity) async {
    try {
      final item = await datasource.deleteItem(languageItemEntity);
      return Right(item);
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.localdb));
    }
  }

  @override
  Future<Either<AppError, LanguageItemEntity>> insertItem(
      LanguageItemEntity languageItemEntity) async {
    try {
      final item = await datasource.insertItem(languageItemEntity);
      return Right(item);
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.localdb));
    }
  }

  @override
  Future<Either<AppError, List<LanguageItemEntity>>> languagelist() async {
    try {
      final item = await datasource.languagelist();
      return Right(item);
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.localdb));
    }
  }

  @override
  Future<Either<AppError, LanguageItemEntity>> updateItem(
      LanguageItemEntity languageItemEntity) async {
    try {
      final item = await datasource.updateItem(languageItemEntity);
      return Right(item);
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.localdb));
    }
  }
}
