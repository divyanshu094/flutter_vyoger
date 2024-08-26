// To parse this JSON data, do
//
//     final gender = genderFromJson(jsonString);

import 'dart:convert';

Gender genderFromJson(String str) => Gender.fromJson(json.decode(str));

String genderToJson(Gender data) => json.encode(data.toJson());

class Gender {
  Gender({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final bool status;
  final int statusCode;
  final String message;
  final List<GenderModel> data;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<GenderModel>.from(
            json["data"].map((x) => GenderModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GenderModel {
  GenderModel({
    required this.id,
    required this.dateCreated,
    required this.dateModified,
    this.createdBy,
    this.modifiedBy,
    required this.status,
    required this.code,
    required this.description,
  });

  final int id;
  final DateTime dateCreated;
  final DateTime dateModified;
  final dynamic createdBy;
  final dynamic modifiedBy;
  final bool status;
  final String code;
  final String description;

  factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateModified: DateTime.parse(json["date_modified"]),
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        status: json["status"],
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "status": status,
        "code": code,
        "description": description,
      };
}
