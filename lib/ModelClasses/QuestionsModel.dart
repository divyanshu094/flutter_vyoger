class QuestionsModel {
  late String _message;
  late bool _status;
  late List<Question> _data;

  QuestionsModel(
      {required String message,
      required bool status,
      required List<Question> data}) {
    this._message = message;
    this._status = status;
    this._data = data;
  }

  String get message => _message;

  set message(String message) => _message = message;

  bool get status => _status;

  set status(bool status) => _status = status;

  List<Question> get data => _data;

  set data(List<Question> data) => _data = data;

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = <Question>[];
      json['data'].forEach((v) {
        _data.add(new Question.fromJson(v));
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

class Question {
  late int _id;
  late String _dateCreated;
  late String _dateModified;
  late String _createdBy;
  late String _modifiedBy;
  late bool _status;
  late String _complQues;

  Question(
      {required int id,
      required String dateCreated,
      required String dateModified,
      required String createdBy,
      required String modifiedBy,
      required bool status,
      required String complQues}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._complQues = complQues;
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

  String get complQues => _complQues;

  set complQues(String complQues) => _complQues = complQues;

  Question.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _complQues = json['compl_ques'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['status'] = this._status;
    data['compl_ques'] = this._complQues;
    return data;
  }
}
