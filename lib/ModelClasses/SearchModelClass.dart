class SearchModel {
  late bool _status;
  late String _message;
  late List<SearchList> _data;

  SearchModel(
      {dynamic status,
      required String message,
      required List<SearchList> data}) {
    this._status = status;
    this._message = message;
    this._data = data;
  }

  dynamic get status => _status;

  set status(dynamic status) => _status = status;

  String get message => _message;

  set message(String message) => _message = message;

  List<SearchList> get data => _data;

  set data(List<SearchList> data) => _data = data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['Message'];
    if (json['data'] != null) {
      _data = <SearchList>[];
      json['data'].forEach((v) {
        _data.add(new SearchList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['Message'] = this._message;
    data['data'] = this._data.map((v) => v.toJson()).toList();
    return data;
  }
}

class SearchList {
  late int _id;
  late String _dateCreated;
  late String _dateModified;
  late dynamic _createdBy;
  late dynamic _modifiedBy;
  late dynamic _status;
  late String _airportId;
  late String _city;
  late String _airportName;
  late String _iataCode;
  late String _icaoCode;
  late String _country;
  late String _column3;
  late dynamic _column4;
  late dynamic _column5;
  late dynamic _column6;
  late dynamic _column7;
  late dynamic _column8;
  late dynamic _column9;
  late dynamic _column10;
  late dynamic _column11;
  late dynamic _column12;
  late String _countryName;

  SearchList(
      {required int id,
      required String dateCreated,
      required String dateModified,
      dynamic createdBy,
      dynamic modifiedBy,
      dynamic status,
      required String airportId,
      required String city,
      required String airportName,
      required String iataCode,
      required String icaoCode,
      required String country,
      required String column3,
      dynamic column4,
      dynamic column5,
      dynamic column6,
      dynamic column7,
      dynamic column8,
      dynamic column9,
      dynamic column10,
      dynamic column11,
      dynamic column12,
      required String countryName}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._airportId = airportId;
    this._city = city;
    this._airportName = airportName;
    this._iataCode = iataCode;
    this._icaoCode = icaoCode;
    this._country = country;
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
    this._countryName = countryName;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get dateCreated => _dateCreated;

  set dateCreated(String dateCreated) => _dateCreated = dateCreated;

  String get dateModified => _dateModified;

  set dateModified(String dateModified) => _dateModified = dateModified;

  dynamic get createdBy => _createdBy;

  set createdBy(dynamic createdBy) => _createdBy = createdBy;

  dynamic get modifiedBy => _modifiedBy;

  set modifiedBy(dynamic modifiedBy) => _modifiedBy = modifiedBy;

  dynamic get status => _status;

  set status(dynamic status) => _status = status;

  String get airportId => _airportId;

  set airportId(String airportId) => _airportId = airportId;

  String get city => _city;

  set city(String city) => _city = city;

  String get airportName => _airportName;

  set airportName(String airportName) => _airportName = airportName;

  String get iataCode => _iataCode;

  set iataCode(String iataCode) => _iataCode = iataCode;

  String get icaoCode => _icaoCode;

  set icaoCode(String icaoCode) => _icaoCode = icaoCode;

  String get country => _country;

  set country(String country) => _country = country;

  String get column3 => _column3;

  set column3(String column3) => _column3 = column3;

  dynamic get column4 => _column4;

  set column4(dynamic column4) => _column4 = column4;

  dynamic get column5 => _column5;

  set column5(dynamic column5) => _column5 = column5;

  dynamic get column6 => _column6;

  set column6(dynamic column6) => _column6 = column6;

  dynamic get column7 => _column7;

  set column7(dynamic column7) => _column7 = column7;

  dynamic get column8 => _column8;

  set column8(dynamic column8) => _column8 = column8;

  dynamic get column9 => _column9;

  set column9(dynamic column9) => _column9 = column9;

  dynamic get column10 => _column10;

  set column10(dynamic column10) => _column10 = column10;

  dynamic get column11 => _column11;

  set column11(dynamic column11) => _column11 = column11;

  dynamic get column12 => _column12;

  set column12(dynamic column12) => _column12 = column12;

  String get countryName => _countryName;

  set countryName(String countryName) => _countryName = countryName;

  SearchList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _airportId = json['airport_id'];
    _city = json['city'];
    _airportName = json['airport_name'];
    _iataCode = json['iata_code'];
    _icaoCode = json['icao_code'];
    _country = json['country'];
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
    _countryName = json['country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['status'] = this._status;
    data['airport_id'] = this._airportId;
    data['city'] = this._city;
    data['airport_name'] = this._airportName;
    data['iata_code'] = this._iataCode;
    data['icao_code'] = this._icaoCode;
    data['country'] = this._country;
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
    data['country_name'] = this._countryName;
    return data;
  }
}