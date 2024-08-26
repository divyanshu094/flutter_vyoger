class PasswordResponse {
  late String _massage;
  late bool _status;

  PasswordResponse({required String massage, required bool status}) {
    this._massage = massage;
    this._status = status;
  }

  String get massage => _massage;
  set massage(String massage) => _massage = massage;
  bool get status => _status;
  set status(bool status) => _status = status;

  PasswordResponse.fromJson(Map<String, dynamic> json) {
    _massage = json['massage'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this._massage;
    data['status'] = this._status;
    return data;
  }
}