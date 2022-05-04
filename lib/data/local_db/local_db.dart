import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDB {
  String dbName = 'LOCALDB.db';
  Future<Database> initDb() async {
    final filePath = await getDatabasesPath();
    final path = join(filePath, dbName);

    return openDatabase(path, onCreate: (database, version) async {
      String textTYPE = 'TEXT NOT NULL';
      String idTYPE = 'INTEGER PRIMARY KEY AUTOINCREMENT';

      await database.execute('''
        CREATE TABLE LOCALDB(
          id $idTYPE,
          title $textTYPE,
          imageAssets $textTYPE,
          language $textTYPE,
          code $textTYPE,
          type $textTYPE,
          page $textTYPE
        )
        
        ''');
    }, version: 1);
  }

  //insert
  Future<LanguageItemEntity> insert(LanguageItemEntity itemEntity) async {
    Database db = await initDb();
    db.insert('LOCALDB', itemEntity.toJson());
    return itemEntity;
  }

  //fetch daily pad
  Future<List<LanguageItemEntity>> fetchList() async {
    Database db = await initDb();
    List<Map<String, Object?>> languageList =
        await db.query('LOCALDB', orderBy: 'title');

    return languageList.map((e) => LanguageItemEntity.fromJson(e)).toList();
  }

  //upda
  Future<LanguageItemEntity> update(LanguageItemEntity itemEntity) async {
    Database db = await initDb();

    await db.update('LOCALDB', itemEntity.toJson(),
        where: 'id = ?', whereArgs: [itemEntity.id]);

    return itemEntity;
  }

  //delete
  Future<LanguageItemEntity> delete(LanguageItemEntity item) async {
    Database db = await initDb();
    await db.delete(
      'LOCALDB',
      where: 'id = ?',
      whereArgs: [item.id],
    );

    return item;
  }

  //close
  Future close() async {
    Database db = await initDb();

    return db.close();
  }
}
