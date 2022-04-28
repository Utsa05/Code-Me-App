// To parse this JSON data, do
//
//     final compileOutputModel = compileOutputModelFromJson(jsonString);

import 'dart:convert';

CompileOutputModel compileOutputModelFromJson(String str) =>
    CompileOutputModel.fromJson(json.decode(str));

String compileOutputModelToJson(CompileOutputModel data) =>
    json.encode(data.toJson());

class CompileOutputModel {
  CompileOutputModel({
    this.status,
    this.timestamp,
    this.compResult,
    this.memory,
    this.time,
    this.language,
    this.submissionId,
    this.code,
    this.errorCode,
    this.output,
    this.input,
    this.rntError,
    this.id,
    this.save,
  });

  String? status;
  DateTime? timestamp;
  String? compResult;
  String? memory;
  String? time;
  String? language;
  String? submissionId;
  String? code;
  String? errorCode;
  String? output;
  String? input;
  String? rntError;
  String? id;
  bool? save;

  factory CompileOutputModel.fromJson(Map<String, dynamic> json) =>
      CompileOutputModel(
        status: json["status"],
        timestamp: DateTime.parse(json["timestamp"]),
        compResult: json["compResult"],
        memory: json["memory"],
        time: json["time"],
        language: json["language"],
        submissionId: json["submission_id"],
        code: json["code"],
        errorCode: json["errorCode"],
        output: json["output"],
        input: json["input"],
        rntError: json["rntError"],
        id: json["id"],
        save: json["save"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "timestamp": timestamp!.toIso8601String(),
        "compResult": compResult,
        "memory": memory,
        "time": time,
        "language": language,
        "submission_id": submissionId,
        "code": code,
        "errorCode": errorCode,
        "output": output,
        "input": input,
        "rntError": rntError,
        "id": id,
        "save": save,
      };
}
