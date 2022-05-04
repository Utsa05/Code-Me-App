import 'package:code_me/domain/entities/app_error.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LocalDBRepository {
  Future<Either<AppError, List<LanguageItemEntity>>> languagelist();
  Future<Either<AppError, LanguageItemEntity>> insertItem(
      LanguageItemEntity languageItemEntity);
  Future<Either<AppError, LanguageItemEntity>> updateItem(
      LanguageItemEntity languageItemEntity);
  Future<Either<AppError, LanguageItemEntity>> deleteItem(
      LanguageItemEntity languageItemEntity);
}
