import 'package:code_me/data/local_db/local_db.dart';
import 'package:code_me/domain/entities/language_item_entity.dart';

abstract class LocalDatasource {
  Future<List<LanguageItemEntity>> languagelist();
  Future<LanguageItemEntity> insertItem(LanguageItemEntity languageItemEntity);
  Future<LanguageItemEntity> updateItem(LanguageItemEntity languageItemEntity);
  Future<LanguageItemEntity> deleteItem(LanguageItemEntity languageItemEntity);
}

class LocalDatasourceImpl implements LocalDatasource {
  LocalDB localDB = LocalDB();
  @override
  Future<LanguageItemEntity> deleteItem(
      LanguageItemEntity languageItemEntity) async {
    final data = await localDB.delete(languageItemEntity);
    return data;
  }

  @override
  Future<LanguageItemEntity> insertItem(
      LanguageItemEntity languageItemEntity) async {
    final data = await localDB.insert(languageItemEntity);
    return data;
  }

  @override
  Future<List<LanguageItemEntity>> languagelist() async {
    final list = await localDB.fetchList();
    return list;
  }

  @override
  Future<LanguageItemEntity> updateItem(
      LanguageItemEntity languageItemEntity) async {
    final data = await localDB.update(languageItemEntity);
    return data;
  }
}
