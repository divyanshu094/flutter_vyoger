// To parse this JSON data, do
//
//     final passportfor = passportforFromMap(jsonString);

// Passportfor passportforFromMap(String str) =>
//     Passportfor.fromMap(json.decode(str));

// String passportforToMap(Passportfor data) => json.encode(data.toMap());
// class RelationList {
//   bool _status;
//   int _statusCode;
//   String _message;
//   List<Relation> _data;

//   RelationList({bool status, int statusCode, String message, List<Relation> data}) {
//     this._status = status;
//     this._statusCode = statusCode;
//     this._message = message;
//     this._data = data;
//   }

//   bool get status => _status;
//   set status(bool status) => _status = status;
//   int get statusCode => _statusCode;
//   set statusCode(int statusCode) => _statusCode = statusCode;
//   String get message => _message;
//   set message(String message) => _message = message;
//   List<Relation> get data => _data;
//   set data(List<Relation> data) => _data = data;
class Passportfor {
  late String massage;
  late bool status;
  late List<Passortrelation> data;

  Passportfor({
    required String massage,
    required bool status,
    required List<Passortrelation> data,
  }) {
    this.status = status;
    this.massage = massage;
    this.data = data;
  }

  //  bool get status => status;
  // set status(bool status) => status = status;
  // String get message => massage;
  // set message(String message) => massage = message;
  //  List<Passortrelation> get data => data;
  // set data(List<Passortrelation> data) => data = data;

  // String massage;
  // bool status;
  // List<Passortrelation> data;

  // factory Passportfor.fromMap(Map<String, dynamic> json) => Passportfor(
  //       massage: json["massage"],
  //       status: json["status"],
  //       data: List<Passortrelation>.from(
  //           json["data"].map((x) => Passortrelation.fromMap(x))),
  //     );

  // Map<String, dynamic> toMap() => {
  //       "massage": massage,
  //       "status": status,
  //       "data": List<dynamic>.from(data.map((x) => x.toMap())),
  //     };

  Passportfor.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['massage'];
    if (json['data'] != null) {
      data = <Passortrelation>[];
      json['data'].forEach((v) {
        data.add(Passortrelation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['massage'] = this.massage;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Passortrelation {
  Passortrelation({
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

  late int id;
  late String dateCreated;
  late String dateModified;
  late String createdBy;
  late String modifiedBy;
  late bool status;
  late String name;
  late String relationship;
  late bool primaryFlag;
  late String countryCode;
  late String secondCountryCode;
  late String phone;
  late String secondPhone;
  late bool isDependent;
  late bool isEmergencyContact;
  late String gender;
  late String email;
  late bool isAddSameAsEmployee;
  late String address1;
  late String address2;
  late String address3;
  late String city;
  late String state;
  late dynamic addressType;
  late String country;
  late String zip;
  late String column1;
  late dynamic column2;
  late dynamic column3;
  late dynamic column4;
  late dynamic column5;
  late dynamic column6;
  late dynamic column7;
  late dynamic column8;
  late dynamic column9;
  late dynamic column10;
  late dynamic column11;
  late dynamic column12;
  late String empCode;
  late dynamic organization;

  Passortrelation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    name = json['name'];
    relationship = json['relationship'];
    primaryFlag = json['primary_flag'];
    countryCode = json['country_code'];
    secondCountryCode = json['second_country_code'];
    phone = json['phone'];
    secondPhone = json['second_phone'];
    isDependent = json['isDependent'];
    isEmergencyContact = json['isEmergencyContact'];
    gender = json['gender'];
    email = json['email'];
    isAddSameAsEmployee = json['isAddSameAsEmployee'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    city = json['city'];
    state = json['state'];
    addressType = json['address_type'];
    country = json['country'];
    zip = json['zip'];
    column1 = json['column1'];
    column2 = json['column2'];
    column3 = json['column3'];
    column4 = json['column4'];
    column5 = json['column5'];
    column6 = json['column6'];
    column7 = json['column7'];
    column8 = json['column8'];
    column9 = json['column9'];
    column10 = json['column10'];
    column11 = json['column11'];
    column12 = json['column12'];
    empCode = json['emp_code'];
    organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['status'] = this.status;
    data['name'] = this.name;
    data['relationship'] = this.relationship;
    data['primary_flag'] = this.primaryFlag;
    data['country_code'] = this.countryCode;
    data['second_country_code'] = this.secondCountryCode;
    data['phone'] = this.phone;
    data['second_phone'] = this.secondPhone;
    data['isDependent'] = this.isDependent;
    data['isEmergencyContact'] = this.isEmergencyContact;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['isAddSameAsEmployee'] = this.isAddSameAsEmployee;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['address3'] = this.address3;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address_type'] = this.addressType;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['column1'] = this.column1;
    data['column2'] = this.column2;
    data['column3'] = this.column3;
    data['column4'] = this.column4;
    data['column5'] = this.column5;
    data['column6'] = this.column6;
    data['column7'] = this.column7;
    data['column8'] = this.column8;
    data['column9'] = this.column9;
    data['column10'] = this.column10;
    data['column11'] = this.column11;
    data['column12'] = this.column12;
    data['emp_code'] = this.empCode;
    data['organization'] = this.organization;
    return data;
  }

// factory Passortrelation.fromMap(Map<String, dynamic> json) => Passortrelation(
//       id: json["id"],
//       dateCreated: json["date_created"],
//       dateModified: json["date_modified"],
//       createdBy: json["created_by"],
//       modifiedBy: json["modified_by"],
//       status: json["status"],
//       name: json["name"],
//       relationship: json["relationship"],
//       primaryFlag: json["primary_flag"],
//       countryCode: json["country_code"],
//       secondCountryCode: json["second_country_code"],
//       phone: json["phone"],
//       secondPhone: json["second_phone"],
//       isDependent: json["isDependent"],
//       isEmergencyContact: json["isEmergencyContact"],
//       gender: json["gender"],
//       email: json["email"],
//       isAddSameAsEmployee: json["isAddSameAsEmployee"],
//       address1: json["address1"],
//       address2: json["address2"],
//       address3: json["address3"],
//       city: json["city"],
//       state: json["state"],
//       addressType: json["address_type"],
//       country: json["country"],
//       zip: json["zip"],
//       column1: json["column1"],
//       column2: json["column2"],
//       column3: json["column3"],
//       column4: json["column4"],
//       column5: json["column5"],
//       column6: json["column6"],
//       column7: json["column7"],
//       column8: json["column8"],
//       column9: json["column9"],
//       column10: json["column10"],
//       column11: json["column11"],
//       column12: json["column12"],
//       empCode: json["emp_code"],
//       organization: json["organization"],
//     );

// Map<String, dynamic> toMap() => {
//       "id": id,
//       "date_created": dateCreated,
//       "date_modified": dateModified,
//       "created_by": createdBy,
//       "modified_by": modifiedBy,
//       "status": status,
//       "name": name,
//       "relationship": relationship,
//       "primary_flag": primaryFlag,
//       "country_code": countryCode,
//       "second_country_code": secondCountryCode,
//       "phone": phone,
//       "second_phone": secondPhone,
//       "isDependent": isDependent,
//       "isEmergencyContact": isEmergencyContact,
//       "gender": gender,
//       "email": email,
//       "isAddSameAsEmployee": isAddSameAsEmployee,
//       "address1": address1,
//       "address2": address2,
//       "address3": address3,
//       "city": city,
//       "state": state,
//       "address_type": addressType,
//       "country": country,
//       "zip": zip,
//       "column1": column1,
//       "column2": column2,
//       "column3": column3,
//       "column4": column4,
//       "column5": column5,
//       "column6": column6,
//       "column7": column7,
//       "column8": column8,
//       "column9": column9,
//       "column10": column10,
//       "column11": column11,
//       "column12": column12,
//       "emp_code": empCode,
//       "organization": organization,
//     };
}
