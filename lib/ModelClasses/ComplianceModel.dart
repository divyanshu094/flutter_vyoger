class ComplianceModel {
  late String _message;
  late bool _status;
  late List<ComplianceData> _data;

  ComplianceModel(
      {required String message,
      required bool status,
      required List<ComplianceData> data}) {
    this._message = message;
    this._status = status;
    this._data = data;
  }

  String get message => _message;

  set message(String message) => _message = message;

  bool get status => _status;

  set status(bool status) => _status = status;

  List<ComplianceData> get data => _data;

  set data(List<ComplianceData> data) => _data = data;

  ComplianceModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = <ComplianceData>[];
      json['data'].forEach((v) {
        _data.add(new ComplianceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    data['status'] = this._status;
    data['data'] = this._data.map((v) => v.toJson()).toList();
    return data;
  }
}

class ComplianceData {
  late int _id;
  late String _empCode;
  late String _complQues;
  late bool _complAns;
  late String _dateCreated;

  ComplianceData(
      {required int id,
      required String empCode,
      required String complQues,
      required bool complAns,
      required String dateCreated}) {
    this._id = id;
    this._empCode = empCode;
    this._complQues = complQues;
    this._complAns = complAns;
    this._dateCreated = dateCreated;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get empCode => _empCode;

  set empCode(String empCode) => _empCode = empCode;

  String get complQues => _complQues;

  set complQues(String complQues) => _complQues = complQues;

  bool get complAns => _complAns;

  set complAns(bool complAns) => _complAns = complAns;

  String get dateCreated => _dateCreated;

  set dateCreated(String dateCreated) => _dateCreated = dateCreated;

  ComplianceData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _empCode = json['emp_code'];
    _complQues = json['compl_ques'];
    _complAns = json['compl_ans'];
    _dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['emp_code'] = this._empCode;
    data['compl_ques'] = this._complQues;
    data['compl_ans'] = this._complAns;
    data['date_created'] = this._dateCreated;
    return data;
  }
}
