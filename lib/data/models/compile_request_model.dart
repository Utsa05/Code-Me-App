// To parse this JSON data, do
//
//     final compileRequestModel = compileRequestModelFromJson(jsonString);

import 'dart:convert';

CompileRequestModel compileRequestModelFromJson(String str) =>
    CompileRequestModel.fromJson(json.decode(str));

String compileRequestModelToJson(CompileRequestModel data) =>
    json.encode(data.toJson());

class CompileRequestModel {
  CompileRequestModel(
      {required this.language,
      required this.code,
      required this.input,
      required this.save,
      this.imagess,
      this.fileName,
      this.id,
      this.page});

  String language;
  String code;
  String input;
  bool save;
  String? imagess;
  String? fileName;
  int? id;
  String? page;

  factory CompileRequestModel.fromJson(Map<String, dynamic> json) =>
      CompileRequestModel(
        language: json["language"],
        code: json["code"],
        input: json["input"],
        save: json["save"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "code": code,
        "input": input,
        "save": save,
      };
}
