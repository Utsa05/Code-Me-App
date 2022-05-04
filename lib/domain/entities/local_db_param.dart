import 'package:code_me/domain/entities/language_item_entity.dart';
import 'package:equatable/equatable.dart';

class LocalDBParms extends Equatable {
  final LanguageItemEntity languageItemEntity;

  const LocalDBParms(this.languageItemEntity);
  @override
  List<Object?> get props => [languageItemEntity];
}
