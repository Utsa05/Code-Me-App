import 'package:code_me/domain/entities/language_item_entity.dart';

class LanguageItemList {
  List<LanguageItemEntity> list = <LanguageItemEntity>[];
  List<LanguageItemEntity> getLanguageItemList() {
    list = [
      // const LanguageItemEntity(
      //     id: 1,
      //     title: 'C',
      //     imageAssets: 'assets/icons/c.png',
      //     language: "C",
      //     type: 'C'),
      const LanguageItemEntity(
          id: 2,
          title: 'C++',
          imageAssets: 'assets/icons/cpp.png',
          language: "Cpp",
          type: 'cpp'),
      const LanguageItemEntity(
          id: 3,
          title: 'Python',
          imageAssets: 'assets/icons/python.png',
          language: "Python",
          type: 'python'),
      const LanguageItemEntity(
          id: 4,
          title: 'Python 3',
          imageAssets: 'assets/icons/python.png',
          language: "Python 3",
          type: 'python'),
      const LanguageItemEntity(
          id: 5,
          title: 'Java',
          imageAssets: 'assets/icons/java.png',
          language: "Java",
          type: 'java'),
      const LanguageItemEntity(
          id: 6,
          title: 'PHP',
          imageAssets: 'assets/icons/php.png',
          language: "Php",
          type: 'php'),
      const LanguageItemEntity(
          id: 7,
          title: 'Perl',
          imageAssets: 'assets/icons/c.png',
          language: "Perl",
          type: 'perl'),
      const LanguageItemEntity(
        id: 8,
        title: 'Scala',
        imageAssets: 'assets/icons/cpp.png',
        language: "Scala",
        type: 'scala',
      ),
    ];

    return list;
  }
}
