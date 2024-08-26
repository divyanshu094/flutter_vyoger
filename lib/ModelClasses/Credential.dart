class Credential {
  late String _username;
  late String _password;
  late bool _checkBiometric = false;

  bool get checkBiometric => _checkBiometric;

  set checkBiometric(bool value) {
    _checkBiometric = value;
  }

  Credential({required String username, required String password, required bool checkbiometric}) {
    this._username = username;
    this._password = password;
    this._checkBiometric = checkBiometric;
  }

  String get username => _username;

  set username(String username) => _username = username;

  String get password => _password;

  set password(String password) => _password = password;

  Credential.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _password = json['password'];
    _checkBiometric = json['checkbiometric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this._username;
    data['password'] = this._password;
    data['checkbiometric'] = this._checkBiometric;
    return data;
  }
}
