// class MaritalListModel {
//   bool _status;
//   String _message;
//   List<MaritalModel> _data;

//   MaritalListModel({bool status, String message, List<MaritalModel> data}) {
//     this._status = status;
//     this._message = message;
//     this._data = data;
//   }

//   bool get status => _status;
//   set status(bool status) => _status = status;
//   String get message => _message;
//   set message(String message) => _message = message;
//   List<MaritalModel> get data => _data;
//   set data(List<MaritalModel> data) => _data = data;

//   MaritalListModel.fromJson(Map<String, dynamic> json) {
//     _status = json['status'];
//     _message = json['Message'];
//     if (json['data'] != null) {
//       _data = new List<MaritalModel>();
//       json['data'].forEach((v) {
//         _data.add(new MaritalModel.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this._status;
//     data['Message'] = this._message;
//     if (this._data != null) {
//       data['data'] = this._data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class MaritalModel {
//   int _id;
//   String _code;
//   String _description;

//   MaritalModel({int id, String code, String description}) {
//     this._id = id;
//     this._code = code;
//     this._description = description;
//   }

//   int get id => _id;
//   set id(int id) => _id = id;
//   String get code => _code;
//   set code(String code) => _code = code;
//   String get description => _description;
//   set description(String description) => _description = description;

//   MaritalModel.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _code = json['code'];
//     _description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this._id;
//     data['code'] = this._code;
//     data['description'] = this._description;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final marital = maritalFromJson(jsonString);

import 'dart:convert';

Marital maritalFromJson(String str) => Marital.fromJson(json.decode(str));

String maritalToJson(Marital data) => json.encode(data.toJson());

class Marital {
  Marital({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final bool status;
  final int statusCode;
  final String message;
  final List<Datum> data;

  factory Marital.fromJson(Map<String, dynamic> json) => Marital(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.dateCreated,
    required this.dateModified,
    required this.createdBy,
    required this.modifiedBy,
    this.status,
    required this.code,
    required this.description,
  });

  final int id;
  final DateTime dateCreated;
  final DateTime dateModified;
  final String createdBy;
  final String modifiedBy;
  final bool? status;
  final String code;
  final String description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateModified: DateTime.parse(json["date_modified"]),
        createdBy: json["created_by"] == null ? null : json["created_by"],
        modifiedBy: json["modified_by"] == null ? null : json["modified_by"],
        status: json["status"],
        code: json["code"] == null ? null : json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "created_by": createdBy == null ? null : createdBy,
        "modified_by": modifiedBy == null ? null : modifiedBy,
        "status": status,
        "code": code == null ? null : code,
        "description": description,
      };
}
