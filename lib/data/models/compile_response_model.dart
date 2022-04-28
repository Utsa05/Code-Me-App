// To parse this JSON data, do
//
//     final compileResponseModel = compileResponseModelFromJson(jsonString);

import 'dart:convert';

CompileResponseModel compileResponseModelFromJson(String str) =>
    CompileResponseModel.fromJson(json.decode(str));

String compileResponseModelToJson(CompileResponseModel data) =>
    json.encode(data.toJson());

class CompileResponseModel {
  CompileResponseModel({
    required this.id,
    required this.submissionId,
    required this.status,
  });

  String id;
  String submissionId;
  String status;

  factory CompileResponseModel.fromJson(Map<String, dynamic> json) =>
      CompileResponseModel(
        id: json["id"],
        submissionId: json["submission_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "submission_id": submissionId,
        "status": status,
      };
}
