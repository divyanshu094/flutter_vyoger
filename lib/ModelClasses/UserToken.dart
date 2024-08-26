class UserToken {
  late String _refresh;
  late String _access;
  String? _detail;
  String? _massage;
  late bool _status;

  UserToken(
      {required String refresh,
      required String access,
      String? detail,
      String? massage,
      required bool status}) {
    this._refresh = refresh;
    this._access = access;
    this._detail = detail;
    this._massage = massage;
    this._status = status;
  }

  String get refresh => _refresh;

  set refresh(String refresh) => _refresh = refresh;

  String get access => _access;

  set access(String access) => _access = access;

  String get detail => _detail!;

  set detail(String detail) => _detail = detail;

  String get massage => _massage!;

  set massage(String massage) => _massage = massage;

  bool get status => _status;

  set status(bool status) => _status = status;

  UserToken.fromJson(Map<String, dynamic> json) {
    _refresh = json['refresh'];
    _access = json['access'];
    _detail = json['detail'];
    _massage = json['massage'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this._refresh;
    data['access'] = this._access;
    data['detail'] = this._detail;
    data['massage'] = this._massage;
    data['status'] = this._status;
    return data;
  }
}
