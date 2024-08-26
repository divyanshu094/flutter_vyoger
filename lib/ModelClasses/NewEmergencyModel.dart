// To parse this JSON data, do
//
//     final newEmergency = newEmergencyFromJson(jsonString);

import 'dart:convert';

NewEmergency newEmergencyFromJson(String str) =>
    NewEmergency.fromJson(json.decode(str));

String newEmergencyToJson(NewEmergency data) => json.encode(data.toJson());

class NewEmergency {
  NewEmergency({
    required this.massage,
    required this.status,
    required this.data,
  });

  String massage;
  bool status;
  List<Datum>? data;

  factory NewEmergency.fromJson(Map<String, dynamic> json) => NewEmergency(
        massage: json["massage"] == null ? null : json["massage"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "massage": massage == null ? null : massage,
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.dateCreated,
    required this.dateModified,
    required this.createdBy,
    required this.modifiedBy,
    required this.status,
    required this.name,
    required this.relationship,
    required this.primaryFlag,
    required this.countryCode,
    required this.secondCountryCode,
    required this.phone,
    required this.secondPhone,
    required this.isDependent,
    required this.isEmergencyContact,
    required this.gender,
    required this.email,
    required this.isAddSameAsEmployee,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.state,
    this.addressType,
    required this.country,
    required this.zip,
    required this.column1,
    this.column2,
    this.column3,
    this.column4,
    this.column5,
    this.column6,
    this.column7,
    this.column8,
    this.column9,
    this.column10,
    this.column11,
    this.column12,
    required this.empCode,
    this.organization,
  });

  int id;
  DateTime? dateCreated;
  DateTime? dateModified;
  String createdBy;
  String modifiedBy;
  bool status;
  String name;
  String relationship;
  bool primaryFlag;
  String countryCode;
  String secondCountryCode;
  String phone;
  String secondPhone;
  bool isDependent;
  bool isEmergencyContact;
  String gender;
  String email;
  bool isAddSameAsEmployee;
  String address1;
  String address2;
  String address3;
  String city;
  String state;
  dynamic addressType;
  String country;
  String zip;
  DateTime? column1;
  dynamic column2;
  dynamic column3;
  dynamic column4;
  dynamic column5;
  dynamic column6;
  dynamic column7;
  dynamic column8;
  dynamic column9;
  dynamic column10;
  dynamic column11;
  dynamic column12;
  String empCode;
  dynamic organization;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        createdBy: json["created_by"] == null ? null : json["created_by"],
        modifiedBy: json["modified_by"] == null ? null : json["modified_by"],
        status: json["status"] == null ? null : json["status"],
        name: json["name"] == null ? null : json["name"],
        relationship:
            json["relationship"] == null ? null : json["relationship"],
        primaryFlag: json["primary_flag"] == null ? null : json["primary_flag"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        secondCountryCode: json["second_country_code"] == null
            ? null
            : json["second_country_code"],
        phone: json["phone"] == null ? null : json["phone"],
        secondPhone: json["second_phone"] == null ? null : json["second_phone"],
        isDependent: json["isDependent"] == null ? null : json["isDependent"],
        isEmergencyContact: json["isEmergencyContact"] == null
            ? null
            : json["isEmergencyContact"],
        gender: json["gender"] == null ? null : json["gender"],
        email: json["email"] == null ? null : json["email"],
        isAddSameAsEmployee: json["isAddSameAsEmployee"] == null
            ? null
            : json["isAddSameAsEmployee"],
        address1: json["address1"] == null ? null : json["address1"],
        address2: json["address2"] == null ? null : json["address2"],
        address3: json["address3"] == null ? null : json["address3"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        addressType: json["address_type"],
        country: json["country"] == null ? null : json["country"],
        zip: json["zip"] == null ? null : json["zip"],
        column1:
            json["column1"] == null ? null : DateTime.parse(json["column1"]),
        column2: json["column2"],
        column3: json["column3"],
        column4: json["column4"],
        column5: json["column5"],
        column6: json["column6"],
        column7: json["column7"],
        column8: json["column8"],
        column9: json["column9"],
        column10: json["column10"],
        column11: json["column11"],
        column12: json["column12"],
        empCode: json["emp_code"] == null ? null : json["emp_code"],
        organization: json["organization"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "date_created":
            dateCreated == null ? null : dateCreated!.toIso8601String(),
        "date_modified":
            dateModified == null ? null : dateModified!.toIso8601String(),
        "created_by": createdBy == null ? null : createdBy,
        "modified_by": modifiedBy == null ? null : modifiedBy,
        "status": status == null ? null : status,
        "name": name == null ? null : name,
        "relationship": relationship == null ? null : relationship,
        "primary_flag": primaryFlag == null ? null : primaryFlag,
        "country_code": countryCode == null ? null : countryCode,
        "second_country_code":
            secondCountryCode == null ? null : secondCountryCode,
        "phone": phone == null ? null : phone,
        "second_phone": secondPhone == null ? null : secondPhone,
        "isDependent": isDependent == null ? null : isDependent,
        "isEmergencyContact":
            isEmergencyContact == null ? null : isEmergencyContact,
        "gender": gender == null ? null : gender,
        "email": email == null ? null : email,
        "isAddSameAsEmployee":
            isAddSameAsEmployee == null ? null : isAddSameAsEmployee,
        "address1": address1 == null ? null : address1,
        "address2": address2 == null ? null : address2,
        "address3": address3 == null ? null : address3,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "address_type": addressType,
        "country": country == null ? null : country,
        "zip": zip == null ? null : zip,
        "column1": column1 == null ? null : column1!.toIso8601String(),
        "column2": column2,
        "column3": column3,
        "column4": column4,
        "column5": column5,
        "column6": column6,
        "column7": column7,
        "column8": column8,
        "column9": column9,
        "column10": column10,
        "column11": column11,
        "column12": column12,
        "emp_code": empCode == null ? null : empCode,
        "organization": organization,
      };
}
