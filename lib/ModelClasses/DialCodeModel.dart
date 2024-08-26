class DialCode {
  late bool _status;
  late String _message;
  late List<Data> _data;

  DialCode(
      {required bool status,
      required String message,
      required List<Data> data}) {
    this._status = status;
    this._message = message;
    this._data = data;
  }

  bool get status => _status;

  set status(bool status) => _status = status;

  String get message => _message;

  set message(String message) => _message = message;

  List<Data> get data => _data;

  set data(List<Data> data) => _data = data;

  DialCode.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['Message'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
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

class Data {
  late int _id;
  late String _dateCreated;
  late String _dateModified;
  late dynamic _createdBy;
  late dynamic _modifiedBy;
  late bool _status;
  late String _name;
  late String _dialCode;
  late String _code;
  late dynamic _organization;

  Data(
      {required int id,
      required String dateCreated,
      required String dateModified,
      dynamic createdBy,
      dynamic modifiedBy,
      required bool status,
      required String name,
      required String dialCode,
      required String code,
      dynamic organization}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._name = name;
    this._dialCode = dialCode;
    this._code = code;
    this._organization = organization;
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

  bool get status => _status;

  set status(bool status) => _status = status;

  String get name => _name;

  set name(String name) => _name = name;

  String get dialCode => _dialCode;

  set dialCode(String dialCode) => _dialCode = dialCode;

  String get code => _code;

  set code(String code) => _code = code;

  dynamic get organization => _organization;

  set organization(dynamic organization) => _organization = organization;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _name = json['name'];
    _dialCode = json['dial_code'];
    _code = json['code'];
    _organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['status'] = this._status;
    data['name'] = this._name;
    data['dial_code'] = this._dialCode;
    data['code'] = this._code;
    data['organization'] = this._organization;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        _id,
        _dateCreated,
        _dateModified,
        _createdBy,
        _modifiedBy,
        _status,
        _name,
        _dialCode,
        _code,
        _organization,
      ];
}
