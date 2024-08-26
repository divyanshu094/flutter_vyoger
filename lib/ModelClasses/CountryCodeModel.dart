// To parse this JSON data, do
//
//     final countrycode = countrycodeFromJson(jsonString);

import 'dart:convert';

Countrycode countrycodeFromJson(String str) =>
    Countrycode.fromJson(json.decode(str));

String countrycodeToJson(Countrycode data) => json.encode(data.toJson());

class Countrycode {
  Countrycode({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<CodeModel> data;

  factory Countrycode.fromJson(Map<String, dynamic> json) => Countrycode(
        status: json["status"],
        message: json["Message"],
        data: List<CodeModel>.from(
            json["data"].map((x) => CodeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "Message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CodeModel {
  CodeModel({
    required this.id,
    required this.dateCreated,
    required this.dateModified,
    required this.createdBy,
    required this.modifiedBy,
    required this.status,
    required this.name,
    required this.dialCode,
    required this.code,
    required this.organization,
  });

  final int id;
  final DateTime dateCreated;
  final DateTime dateModified;
  final dynamic createdBy;
  final dynamic modifiedBy;
  final bool status;
  final String name;
  final String dialCode;
  final String code;
  final dynamic organization;

  factory CodeModel.fromJson(Map<String, dynamic> json) => CodeModel(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateModified: DateTime.parse(json["date_modified"]),
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        status: json["status"],
        name: json["name"],
        dialCode: json["dial_code"],
        code: json["code"],
        organization: json["organization"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "status": status,
        "name": name,
        "dial_code": dialCode,
        "code": code,
        "organization": organization,
      };
}
