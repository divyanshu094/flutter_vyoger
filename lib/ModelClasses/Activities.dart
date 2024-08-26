class Activities {
  late String _massage;
  late bool _status;
  late List<Activity> _data;

  Activities(
      {required String massage,
      required bool status,
      required List<Activity> data}) {
    this._massage = massage;
    this._status = status;
    this._data = data;
  }

  String get massage => _massage;

  set massage(String massage) => _massage = massage;

  bool get status => _status;

  set status(bool status) => _status = status;

  List<Activity> get data => _data;

  set data(List<Activity> data) => _data = data;

  Activities.fromJson(Map<String, dynamic> json) {
    _massage = json['massage'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = <Activity>[];
      json['data'].forEach((v) {
        _data.add(new Activity.fromJson(v));
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

class Activity {
  late int _id;
  late String _activityName;
  late String _activitySortName;
  late String _isVisible;
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

  Activity(
      {required int id,
      required String activityName,
      required String activitySortName,
      required String isVisible,
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
      required String column12}) {
    this._id = id;
    this._activityName = activityName;
    this._activitySortName = activitySortName;
    this._isVisible = isVisible;
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
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get activityName => _activityName;

  set activityName(String activityName) => _activityName = activityName;

  String get activitySortName => _activitySortName;

  set activitySortName(String activitySortName) =>
      _activitySortName = activitySortName;

  String get isVisible => _isVisible;

  set isVisible(String isVisible) => _isVisible = isVisible;

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

  Activity.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _activityName = json['activity_name'];
    _activitySortName = json['activity_sort_name'];
    _isVisible = json['is_visible'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['activity_name'] = this._activityName;
    data['activity_sort_name'] = this._activitySortName;
    data['is_visible'] = this._isVisible;
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
    return data;
  }
}
