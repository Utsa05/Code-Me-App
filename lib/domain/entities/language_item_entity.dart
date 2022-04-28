import 'package:equatable/equatable.dart';

class LanguageItemEntity extends Equatable {
  final int id;
  final String title;
  final String language;
  final String imageAssets;
  final String type;

  const LanguageItemEntity(
      {required this.id,
      required this.title,
      required this.imageAssets,
      required this.language,
      required this.type});
  @override
  List<Object?> get props => [id, title];
}