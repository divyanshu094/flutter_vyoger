import 'package:equatable/equatable.dart';

class PostLocationResponse {
  late String _message;
  late int _statusCode;
  late bool _status;
  late List<PostLocationData> _data;

  PostLocationResponse(
      {required String message,
      required int statusCode,
      required bool status,
      required List<PostLocationData> data}) {
    this._message = message;
    this._statusCode = statusCode;
    this._status = status;
    this._data = data;
  }

  String get message => _message;

  set message(String message) => _message = message;

  int get statusCode => _statusCode;

  set statusCode(int statusCode) => _statusCode = statusCode;

  bool get status => _status;

  set status(bool status) => _status = status;

  List<PostLocationData> get data => _data;

  set data(List<PostLocationData> data) => _data = data;

  PostLocationResponse.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _statusCode = json['status_code'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = <PostLocationData>[];
      json['data'].forEach((v) {
        _data.add(new PostLocationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    data['status_code'] = this._statusCode;
    data['status'] = this._status;
    data['data'] = this._data.map((v) => v.toJson()).toList();
    return data;
  }
}

class PostLocationData extends Equatable {
  late int _id;
  late String _dateCreated;
  late String _dateModified;
  late String _createdBy;
  late String _modifiedBy;
  late String _locationCode;
  late String _locationName;
  late String _description;
  late String _status;
  late String _group;
  late String _timezone;
  late String _effectiveStartDate;
  late String _effectiveEndDate;
  late String _addressLine1;
  late String _city;
  late String _county;
  late String _state;
  late String _zip;
  late String _country;
  late String _primaryPhone;
  late String _secondaryPhone;
  late String _fax;
  late String _column1;
  late String _column2;
  late String _column3;
  late String _column4;
  late String _column5;
  late String _column6;
  late String _column7;
  late String _column8;
  late String _column9;
  late String _column10;
  late String _column11;
  late String _column12;
  dynamic _organization;

  PostLocationData(
     {required int id,
      required String dateCreated,
      required String dateModified,
      required String createdBy,
      required String modifiedBy,
      required String locationCode,
      required String locationName,
      required String description,
      required String status,
      required String group,
      required String timezone,
      required String effectiveStartDate,
      required String effectiveEndDate,
      required String addressLine1,
      required String city,
      required String county,
      required String state,
      required String zip,
      required String country,
      required String primaryPhone,
      required String secondaryPhone,
      required String fax,
      required String column1,
      required String column2,
      required String column3,
      required String column4,
      required String column5,
      required String column6,
      required String column7,
      required String column8,
      required String column9,
      required String column10,
      required String column11,
      required String column12,
      dynamic organization}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._locationCode = locationCode;
    this._locationName = locationName;
    this._description = description;
    this._status = status;
    this._group = group;
    this._timezone = timezone;
    this._effectiveStartDate = effectiveStartDate;
    this._effectiveEndDate = effectiveEndDate;
    this._addressLine1 = addressLine1;
    this._city = city;
    this._county = county;
    this._state = state;
    this._zip = zip;
    this._country = country;
    this._primaryPhone = primaryPhone;
    this._secondaryPhone = secondaryPhone;
    this._fax = fax;
    this._column1 = column1;
    this._column2 = column2;
    this._column3 = column3;
    this._column4 = column4;
    this._column5 = column5;
    this._column6 = column6;
    this._column7 = column7;
    this._column8 = column8;
    this._column9 = column9;
    this._column10 = column10;
    this._column11 = column11;
    this._column12 = column12;
    this._organization = organization;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get dateCreated => _dateCreated;

  set dateCreated(String dateCreated) => _dateCreated = dateCreated;

  String get dateModified => _dateModified;

  set dateModified(String dateModified) => _dateModified = dateModified;

  String get createdBy => _createdBy;

  set createdBy(String createdBy) => _createdBy = createdBy;

  String get modifiedBy => _modifiedBy;

  set modifiedBy(String modifiedBy) => _modifiedBy = modifiedBy;

  String get locationCode => _locationCode;

  set locationCode(String locationCode) => _locationCode = locationCode;

  String get locationName => _locationName;

  set locationName(String locationName) => _locationName = locationName;

  String get description => _description;

  set description(String description) => _description = description;

  String get status => _status;

  set status(String status) => _status = status;

  String get group => _group;

  set group(String group) => _group = group;

  String get timezone => _timezone;

  set timezone(String timezone) => _timezone = timezone;

  String get effectiveStartDate => _effectiveStartDate;

  set effectiveStartDate(String effectiveStartDate) =>
      _effectiveStartDate = effectiveStartDate;

  String get effectiveEndDate => _effectiveEndDate;

  set effectiveEndDate(String effectiveEndDate) =>
      _effectiveEndDate = effectiveEndDate;

  String get addressLine1 => _addressLine1;

  set addressLine1(String addressLine1) => _addressLine1 = addressLine1;

  String get city => _city;

  set city(String city) => _city = city;

  String get county => _county;

  set county(String county) => _county = county;

  String get state => _state;

  set state(String state) => _state = state;

  String get zip => _zip;

  set zip(String zip) => _zip = zip;

  String get country => _country;

  set country(String country) => _country = country;

  String get primaryPhone => _primaryPhone;

  set primaryPhone(String primaryPhone) => _primaryPhone = primaryPhone;

  String get secondaryPhone => _secondaryPhone;

  set secondaryPhone(String secondaryPhone) => _secondaryPhone = secondaryPhone;

  String get fax => _fax;

  set fax(String fax) => _fax = fax;

  String get column1 => _column1;

  set column1(String column1) => _column1 = column1;

  String get column2 => _column2;

  set column2(String column2) => _column2 = column2;

  String get column3 => _column3;

  set column3(String column3) => _column3 = column3;

  String get column4 => _column4;

  set column4(String column4) => _column4 = column4;

  String get column5 => _column5;

  set column5(String column5) => _column5 = column5;

  String get column6 => _column6;

  set column6(String column6) => _column6 = column6;

  String get column7 => _column7;

  set column7(String column7) => _column7 = column7;

  String get column8 => _column8;

  set column8(String column8) => _column8 = column8;

  String get column9 => _column9;

  set column9(String column9) => _column9 = column9;

  String get column10 => _column10;

  set column10(String column10) => _column10 = column10;

  String get column11 => _column11;

  set column11(String column11) => _column11 = column11;

  String get column12 => _column12;

  set column12(String column12) => _column12 = column12;

  dynamic get organization => _organization;

  set organization(dynamic organization) => _organization = organization;

  PostLocationData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _locationCode = json['location_code'];
    _locationName = json['location_name'];
    _description = json['description'];
    _status = json['status'];
    _group = json['group'];
    _timezone = json['timezone'];
    _effectiveStartDate = json['effective_start_date'];
    _effectiveEndDate = json['effective_end_date'];
    _addressLine1 = json['address_line_1'];
    _city = json['city'];
    _county = json['county'];
    _state = json['state'];
    _zip = json['zip'];
    _country = json['country'];
    _primaryPhone = json['primary_phone'];
    _secondaryPhone = json['secondary_phone'];
    _fax = json['fax'];
    _column1 = json['column1'];
    _column2 = json['column2'];
    _column3 = json['column3'];
    _column4 = json['column4'];
    _column5 = json['column5'];
    _column6 = json['column6'];
    _column7 = json['column7'];
    _column8 = json['column8'];
    _column9 = json['column9'];
    _column10 = json['column10'];
    _column11 = json['column11'];
    _column12 = json['column12'];
    _organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['location_code'] = this._locationCode;
    data['location_name'] = this._locationName;
    data['description'] = this._description;
    data['status'] = this._status;
    data['group'] = this._group;
    data['timezone'] = this._timezone;
    data['effective_start_date'] = this._effectiveStartDate;
    data['effective_end_date'] = this._effectiveEndDate;
    data['address_line_1'] = this._addressLine1;
    data['city'] = this._city;
    data['county'] = this._county;
    data['state'] = this._state;
    data['zip'] = this._zip;
    data['country'] = this._country;
    data['primary_phone'] = this._primaryPhone;
    data['secondary_phone'] = this._secondaryPhone;
    data['fax'] = this._fax;
    data['column1'] = this._column1;
    data['column2'] = this._column2;
    data['column3'] = this._column3;
    data['column4'] = this._column4;
    data['column5'] = this._column5;
    data['column6'] = this._column6;
    data['column7'] = this._column7;
    data['column8'] = this._column8;
    data['column9'] = this._column9;
    data['column10'] = this._column10;
    data['column11'] = this._column11;
    data['column12'] = this._column12;
    data['organization'] = this._organization;
    return data;
  }

  // @override
  // bool get stringify {}

  @override
  List<Object> get props => [
        id,
        dateCreated,
        dateModified,
        createdBy,
        modifiedBy,
        locationCode,
        locationName,
        description,
        status,
        group,
        timezone,
        effectiveStartDate,
        effectiveEndDate,
        addressLine1,
        city,
        county,
        state,
        zip,
        country,
        primaryPhone,
        secondaryPhone,
        fax,
        column1,
        column2,
        column3,
        column4,
        column5,
        column6,
        column7,
        column8,
        column9,
        column10,
        column11,
        column12,
        organization
      ];
}
