import 'package:equatable/equatable.dart';

class LanguageItemEntity extends Equatable {
  final int id;
  final String title;
  final String language;
  final String imageAssets;
  final String type;
  final String? code;
  final String? page;

  const LanguageItemEntity({
    required this.id,
    required this.title,
    required this.imageAssets,
    required this.language,
    required this.type,
    this.code,
    this.page,
  });

  factory LanguageItemEntity.fromJson(Map<String, dynamic> json) =>
      LanguageItemEntity(
        id: json["id"],
        title: json["title"],
        language: json["language"],
        imageAssets: json["imageAssets"],
        type: json["type"],
        code: json["code"],
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "language": language,
        "imageAssets": imageAssets,
        "type": type,
        "code": code,
        "page": page,
      };
  @override
  List<Object?> get props => [id, title];
}
