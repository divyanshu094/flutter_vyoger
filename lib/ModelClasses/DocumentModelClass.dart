class DocumentModelClass {
  late String _massage;
  late bool _status;
  late List<Data> _data;

  DocumentModelClass(
      {required String massage,
      required bool status,
      required List<Data> data}) {
    this._massage = massage;
    this._status = status;
    this._data = data;
  }

  String get massage => _massage;

  set massage(String massage) => _massage = massage;

  bool get status => _status;

  set status(bool status) => _status = status;

  List<Data> get data => _data;

  set data(List<Data> data) => _data = data;

  DocumentModelClass.fromJson(Map<String, dynamic> json) {
    _massage = json['massage'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this._massage;
    data['status'] = this._status;
    data['data'] = this._data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  late int _id;
  late String _dateCreated;
  late String _dateModified;
  late String _createdBy;
  late String _modifiedBy;
  late bool _status;
  late String _docName;
  late String _docDescription;
  late String _documentUrl;
  late String _empCode;
  late String _vaultType;

  Data(
      {required int id,
      required String dateCreated,
      required String dateModified,
      required String createdBy,
      required String modifiedBy,
      required bool status,
      required String docName,
      required String docDescription,
      required String documentUrl,
      required String empCode,
      required String vaultType}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._docName = docName;
    this._docDescription = docDescription;
    this._documentUrl = documentUrl;
    this._empCode = empCode;
    this._vaultType = vaultType;
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

  bool get status => _status;

  set status(bool status) => _status = status;

  String get docName => _docName;

  set docName(String docName) => _docName = docName;

  String get docDescription => _docDescription;

  set docDescription(String docDescription) => _docDescription = docDescription;

  String get documentUrl => _documentUrl;

  set documentUrl(String documentUrl) => _documentUrl = documentUrl;

  String get empCode => _empCode;

  set empCode(String empCode) => _empCode = empCode;

  String get vaultType => _vaultType;

  set vaultType(String vaultType) => _vaultType = vaultType;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _docName = json['doc_name'];
    _docDescription = json['doc_description'];
    _documentUrl = json['document_url'];
    _empCode = json['emp_code'];
    _vaultType = json['vault_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['status'] = this._status;
    data['doc_name'] = this._docName;
    data['doc_description'] = this._docDescription;
    data['document_url'] = this._documentUrl;
    data['emp_code'] = this._empCode;
    data['vault_type'] = this._vaultType;
    return data;
  }
}
