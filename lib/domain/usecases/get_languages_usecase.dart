import 'package:code_me/domain/entities/app_error.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:code_me/domain/entities/no_parms.dart';
import 'package:code_me/domain/repositories/localdb_repository.dart';
import 'package:code_me/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetLanguageUsecase extends Usecase<List<LanguageItemEntity>, NoParms> {
  final LocalDBRepository localDBRepository;

  GetLanguageUsecase(this.localDBRepository);

  @override
  Future<Either<AppError, List<LanguageItemEntity>>> call(
      NoParms params) async {
    return await localDBRepository.languagelist();
  }
}
