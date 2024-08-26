// class UserInfo {
//   late String _massage;
//   late bool _status;
//   late Data _data;
//
//   UserInfo(
//       {required String massage, required bool status, required Data data}) {
//     this._massage = massage;
//     this._status = status;
//     this._data = data;
//   }
//
//   String get massage => _massage;
//
//   set massage(String massage) => _massage = massage;
//
//   bool get status => _status;
//
//   set status(bool status) => _status = status;
//
//   Data get data => _data;
//
//   set data(Data data) => _data = data;
//
//   UserInfo.fromJson(Map<String, dynamic> json) {
//     _massage = json['massage'];
//     _status = json['status'];
//     _data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['massage'] = this._massage;
//     data['status'] = this._status;
//     data['data'] = this._data.toJson();
//     return data;
//   }
// }
//
// class Data {
//   late int _id;
//   late String _dateCreated;
//   late String _dateModified;
//   late String _createdBy;
//   late String _modifiedBy;
//   late bool _status;
//   late String _empCode;
//   late String _personId;
//   late String _loginMethod;
//   late String _termandcondtion;
//   late dynamic _istemporary;
//   late String _userName;
//   late String _firstName;
//   late String _lastName;
//   String? _middleName;
//   String? _preferredFirstName;
//   late dynamic _preferredLastName;
//   String? _salutation;
//   late dynamic _initials;
//   late dynamic _title;
//   String? _suffix;
//   late dynamic _displayName;
//   late dynamic _formalName;
//   late dynamic _birthName;
//   late dynamic _namePrefix;
//   String? _gender;
//   String? _maritalStatus;
//   late dynamic _maritalStatusSince;
//   String? _countryOfBirth;
//   String? _nationality;
//   String? _secondNationality;
//   late dynamic _nativePreferredLang;
//   late dynamic _partnerName;
//   late dynamic _partnerNamePrefix;
//   late dynamic _note;
//   String? _dob;
//   String? _placeOfBirth;
//   String? _activeStartDate;
//   String? _activeEndDate;
//   String? _email;
//   String? _password;
//   late dynamic _department;
//   late String _role;
//   String? _photo;
//   late String? _assignmentRole;
//   late String? _organization;
//   late String? _supervisor;
//   late dynamic _column1;
//   late dynamic _column2;
//   late dynamic _column3;
//   late dynamic _column4;
//   late dynamic _column5;
//   late dynamic _column6;
//   late dynamic _column7;
//   late dynamic _column8;
//   late dynamic _column9;
//   late dynamic _column10;
//   late dynamic _column11;
//   late dynamic _column12;
//   late String? _orgId;
//   late String? _home;
//   late String? _approver;
//
//   Data(
//       {required int id,
//       required String dateCreated,
//       required String dateModified,
//       required String createdBy,
//       required String modifiedBy,
//       required bool status,
//       required String empCode,
//       required String personId,
//       required String loginMethod,
//       required String termandcondtion,
//       dynamic istemporary,
//       required String userName,
//       required String firstName,
//       required String lastName,
//       String? middleName,
//       required String preferredFirstName,
//       dynamic preferredLastName,
//       required String salutation,
//       dynamic initials,
//       dynamic title,
//       required String suffix,
//       dynamic displayName,
//       dynamic formalName,
//       dynamic birthName,
//       dynamic namePrefix,
//       required String gender,
//       required String maritalStatus,
//       dynamic maritalStatusSince,
//       required String countryOfBirth,
//       required String nationality,
//       required String secondNationality,
//       dynamic nativePreferredLang,
//       dynamic partnerName,
//       dynamic partnerNamePrefix,
//       dynamic note,
//       required String dob,
//       required String placeOfBirth,
//       required String activeStartDate,
//       required String activeEndDate,
//       required String email,
//       required String password,
//       dynamic department,
//       required String role,
//       required String photo,
//       required String assignmentRole,
//       required String organization,
//       required String supervisor,
//       dynamic column1,
//       dynamic column2,
//       dynamic column3,
//       dynamic column4,
//       dynamic column5,
//       dynamic column6,
//       dynamic column7,
//       dynamic column8,
//       dynamic column9,
//       dynamic column10,
//       dynamic column11,
//       dynamic column12,
//       required String orgId,
//       required String home,
//       required String approver}) {
//     this._id = id;
//     this._dateCreated = dateCreated;
//     this._dateModified = dateModified;
//     this._createdBy = createdBy;
//     this._modifiedBy = modifiedBy;
//     this._status = status;
//     this._empCode = empCode;
//     this._personId = personId;
//     this._loginMethod = loginMethod;
//     this._termandcondtion = termandcondtion;
//     this._istemporary = istemporary;
//     this._userName = userName;
//     this._firstName = firstName;
//     this._lastName = lastName;
//     this._middleName = middleName!;
//     this._preferredFirstName = preferredFirstName;
//     this._preferredLastName = preferredLastName;
//     this._salutation = salutation;
//     this._initials = initials;
//     this._title = title;
//     this._suffix = suffix;
//     this._displayName = displayName;
//     this._formalName = formalName;
//     this._birthName = birthName;
//     this._namePrefix = namePrefix;
//     this._gender = gender;
//     this._maritalStatus = maritalStatus;
//     this._maritalStatusSince = maritalStatusSince;
//     this._countryOfBirth = countryOfBirth;
//     this._nationality = nationality;
//     this._secondNationality = secondNationality;
//     this._nativePreferredLang = nativePreferredLang;
//     this._partnerName = partnerName;
//     this._partnerNamePrefix = partnerNamePrefix;
//     this._note = note;
//     this._dob = dob;
//     this._placeOfBirth = placeOfBirth;
//     this._activeStartDate = activeStartDate;
//     this._activeEndDate = activeEndDate;
//     this._email = email;
//     this._password = password;
//     this._department = department;
//     this._role = role;
//     this._photo = photo;
//     this._assignmentRole = assignmentRole;
//     this._organization = organization;
//     this._supervisor = supervisor;
//     this._column1 = column1;
//     this._column2 = column2;
//     this._column3 = column3;
//     this._column4 = column4;
//     this._column5 = column5;
//     this._column6 = column6;
//     this._column7 = column7;
//     this._column8 = column8;
//     this._column9 = column9;
//     this._column10 = column10;
//     this._column11 = column11;
//     this._column12 = column12;
//     this._orgId = orgId;
//     this._home = home;
//     this._approver = approver;
//   }
//
//   int get id => _id;
//
//   set id(int id) => _id = id;
//
//   String get dateCreated => _dateCreated;
//
//   set dateCreated(String dateCreated) => _dateCreated = dateCreated;
//
//   String get dateModified => _dateModified;
//
//   set dateModified(String dateModified) => _dateModified = dateModified;
//
//   String get createdBy => _createdBy;
//
//   set createdBy(String createdBy) => _createdBy = createdBy;
//
//   String get modifiedBy => _modifiedBy;
//
//   set modifiedBy(String modifiedBy) => _modifiedBy = modifiedBy;
//
//   bool get status => _status;
//
//   set status(bool status) => _status = status;
//
//   String get empCode => _empCode;
//
//   set empCode(String empCode) => _empCode = empCode;
//
//   String get personId => _personId;
//
//   set personId(String personId) => _personId = personId;
//
//   String get loginMethod => _loginMethod;
//
//   set loginMethod(String loginMethod) => _loginMethod = loginMethod;
//
//   String get termandcondtion => _termandcondtion;
//
//   set termandcondtion(String termandcondtion) =>
//       _termandcondtion = termandcondtion;
//
//   dynamic get istemporary => _istemporary;
//
//   set istemporary(dynamic istemporary) => _istemporary = istemporary;
//
//   String get userName => _userName;
//
//   set userName(String userName) => _userName = userName;
//
//   String get firstName => _firstName;
//
//   set firstName(String firstName) => _firstName = firstName;
//
//   String get lastName => _lastName;
//
//   set lastName(String lastName) => _lastName = lastName;
//
//   String get middleName => _middleName!;
//
//   set middleName(String middleName) => _middleName = middleName;
//
//   String get preferredFirstName => _preferredFirstName!;
//
//   set preferredFirstName(String preferredFirstName) =>
//       _preferredFirstName = preferredFirstName;
//
//   dynamic get preferredLastName => _preferredLastName;
//
//   set preferredLastName(dynamic preferredLastName) =>
//       _preferredLastName = preferredLastName;
//
//   String get salutation => _salutation!;
//
//   set salutation(String salutation) => _salutation = salutation;
//
//   dynamic get initials => _initials;
//
//   set initials(dynamic initials) => _initials = initials;
//
//   dynamic get title => _title;
//
//   set title(dynamic title) => _title = title;
//
//   String get suffix => _suffix!;
//
//   set suffix(String suffix) => _suffix = suffix;
//
//   dynamic get displayName => _displayName;
//
//   set displayName(dynamic displayName) => _displayName = displayName;
//
//   dynamic get formalName => _formalName;
//
//   set formalName(dynamic formalName) => _formalName = formalName;
//
//   dynamic get birthName => _birthName;
//
//   set birthName(dynamic birthName) => _birthName = birthName;
//
//   dynamic get namePrefix => _namePrefix;
//
//   set namePrefix(dynamic namePrefix) => _namePrefix = namePrefix;
//
//   String get gender => _gender!;
//
//   set gender(String gender) => _gender = gender;
//
//   String get maritalStatus => _maritalStatus!;
//
//   set maritalStatus(String maritalStatus) => _maritalStatus = maritalStatus;
//
//   dynamic get maritalStatusSince => _maritalStatusSince;
//
//   set maritalStatusSince(dynamic maritalStatusSince) =>
//       _maritalStatusSince = maritalStatusSince;
//
//   String get countryOfBirth => _countryOfBirth!;
//
//   set countryOfBirth(String countryOfBirth) => _countryOfBirth = countryOfBirth;
//
//   String get nationality => _nationality!;
//
//   set nationality(String nationality) => _nationality = nationality;
//
//   String get secondNationality => _secondNationality!;
//
//   set secondNationality(String secondNationality) =>
//       _secondNationality = secondNationality;
//
//   dynamic get nativePreferredLang => _nativePreferredLang;
//
//   set nativePreferredLang(dynamic nativePreferredLang) =>
//       _nativePreferredLang = nativePreferredLang;
//
//   dynamic get partnerName => _partnerName;
//
//   set partnerName(dynamic partnerName) => _partnerName = partnerName;
//
//   dynamic get partnerNamePrefix => _partnerNamePrefix;
//
//   set partnerNamePrefix(dynamic partnerNamePrefix) =>
//       _partnerNamePrefix = partnerNamePrefix;
//
//   dynamic get note => _note;
//
//   set note(dynamic note) => _note = note;
//
//   String get dob => _dob!;
//
//   set dob(String dob) => _dob = dob;
//
//   String get placeOfBirth => _placeOfBirth!;
//
//   set placeOfBirth(String placeOfBirth) => _placeOfBirth = placeOfBirth;
//
//   String get activeStartDate => _activeStartDate!;
//
//   set activeStartDate(String activeStartDate) =>
//       _activeStartDate = activeStartDate;
//
//   String get activeEndDate => _activeEndDate!;
//
//   set activeEndDate(String activeEndDate) => _activeEndDate = activeEndDate;
//
//   String get email => _email!;
//
//   set email(String email) => _email = email;
//
//   String get password => _password!;
//
//   set password(String password) => _password = password;
//
//   dynamic get department => _department;
//
//   set department(dynamic department) => _department = department;
//
//   String get role => _role;
//
//   set role(String role) => _role = role;
//
//   String get photo => _photo!;
//
//   set photo(String photo) => _photo = photo;
//
//   String get assignmentRole => _assignmentRole!;
//
//   set assignmentRole(String assignmentRole) => _assignmentRole = assignmentRole;
//
//   String get organization => _organization!;
//
//   set organization(String organization) => _organization = organization;
//
//   String get supervisor => _supervisor!;
//
//   set supervisor(String supervisor) => _supervisor = supervisor;
//
//   dynamic get column1 => _column1;
//
//   set column1(dynamic column1) => _column1 = column1;
//
//   dynamic get column2 => _column2;
//
//   set column2(dynamic column2) => _column2 = column2;
//
//   dynamic get column3 => _column3;
//
//   set column3(dynamic column3) => _column3 = column3;
//
//   dynamic get column4 => _column4;
//
//   set column4(dynamic column4) => _column4 = column4;
//
//   dynamic get column5 => _column5;
//
//   set column5(dynamic column5) => _column5 = column5;
//
//   dynamic get column6 => _column6;
//
//   set column6(dynamic column6) => _column6 = column6;
//
//   dynamic get column7 => _column7;
//
//   set column7(dynamic column7) => _column7 = column7;
//
//   dynamic get column8 => _column8;
//
//   set column8(dynamic column8) => _column8 = column8;
//
//   dynamic get column9 => _column9;
//
//   set column9(dynamic column9) => _column9 = column9;
//
//   dynamic get column10 => _column10;
//
//   set column10(dynamic column10) => _column10 = column10;
//
//   dynamic get column11 => _column11;
//
//   set column11(dynamic column11) => _column11 = column11;
//
//   dynamic get column12 => _column12;
//
//   set column12(dynamic column12) => _column12 = column12;
//
//   String get orgId => _orgId!;
//
//   set orgId(String orgId) => _orgId = orgId;
//
//   String get home => _home!;
//
//   set home(String home) => _home = home;
//
//   String get approver => _approver!;
//
//   set approver(String approver) => _approver = approver;
//
//   Data.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _dateCreated = json['date_created'];
//     _dateModified = json['date_modified'];
//     _createdBy = json['created_by'];
//     _modifiedBy = json['modified_by'];
//     _status = json['status'];
//     _empCode = json['emp_code'];
//     _personId = json['person_id'];
//     _loginMethod = json['login_method'];
//     _termandcondtion = json['termandcondtion'];
//     _istemporary = json['istemporary'];
//     _userName = json['user_name'];
//     _firstName = json['first_name'];
//     _lastName = json['last_name'];
//     _middleName = json['middle_name'];
//     _preferredFirstName = json['preferred_first_name'];
//     _preferredLastName = json['preferred_last_name'];
//     _salutation = json['salutation'];
//     _initials = json['initials'];
//     _title = json['title'];
//     _suffix = json['suffix'];
//     _displayName = json['display_name'];
//     _formalName = json['formal_name'];
//     _birthName = json['birth_name'];
//     _namePrefix = json['name_prefix'];
//     _gender = json['gender'];
//     _maritalStatus = json['marital_status'];
//     _maritalStatusSince = json['marital_status_since'];
//     _countryOfBirth = json['country_of_birth'];
//     _nationality = json['nationality'];
//     _secondNationality = json['second_nationality'];
//     _nativePreferredLang = json['native_preferred_lang'];
//     _partnerName = json['partner_name'];
//     _partnerNamePrefix = json['partner_name_prefix'];
//     _note = json['note'];
//     _dob = json['dob'];
//     _placeOfBirth = json['place_of_birth'];
//     _activeStartDate = json['active_start_date'];
//     _activeEndDate = json['active_end_date'];
//     _email = json['email'];
//     _password = json['password'];
//     _department = json['department'];
//     _role = json['role'];
//     // _photo = json['photo'];
//     _assignmentRole = json['assignment_role'];
//     _organization = json['organization'];
//     _supervisor = json['supervisor'];
//     _column1 = json['column1'];
//     _column2 = json['column2'];
//     _column3 = json['column3'];
//     _column4 = json['column4'];
//     _column5 = json['column5'];
//     _column6 = json['column6'];
//     _column7 = json['column7'];
//     _column8 = json['column8'];
//     _column9 = json['column9'];
//     _column10 = json['column10'];
//     _column11 = json['column11'];
//     _column12 = json['column12'];
//     _orgId = json['org_id'];
//     _home = json['home'];
//     _approver = json['approver'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this._id;
//     data['date_created'] = this._dateCreated;
//     data['date_modified'] = this._dateModified;
//     data['created_by'] = this._createdBy;
//     data['modified_by'] = this._modifiedBy;
//     data['status'] = this._status;
//     data['emp_code'] = this._empCode;
//     data['person_id'] = this._personId;
//     data['login_method'] = this._loginMethod;
//     data['termandcondtion'] = this._termandcondtion;
//     data['istemporary'] = this._istemporary;
//     data['user_name'] = this._userName;
//     data['first_name'] = this._firstName;
//     data['last_name'] = this._lastName;
//     data['middle_name'] = this._middleName;
//     data['preferred_first_name'] = this._preferredFirstName;
//     data['preferred_last_name'] = this._preferredLastName;
//     data['salutation'] = this._salutation;
//     data['initials'] = this._initials;
//     data['title'] = this._title;
//     data['suffix'] = this._suffix;
//     data['display_name'] = this._displayName;
//     data['formal_name'] = this._formalName;
//     data['birth_name'] = this._birthName;
//     data['name_prefix'] = this._namePrefix;
//     data['gender'] = this._gender;
//     data['marital_status'] = this._maritalStatus;
//     data['marital_status_since'] = this._maritalStatusSince;
//     data['country_of_birth'] = this._countryOfBirth;
//     data['nationality'] = this._nationality;
//     data['second_nationality'] = this._secondNationality;
//     data['native_preferred_lang'] = this._nativePreferredLang;
//     data['partner_name'] = this._partnerName;
//     data['partner_name_prefix'] = this._partnerNamePrefix;
//     data['note'] = this._note;
//     data['dob'] = this._dob;
//     data['place_of_birth'] = this._placeOfBirth;
//     data['active_start_date'] = this._activeStartDate;
//     data['active_end_date'] = this._activeEndDate;
//     data['email'] = this._email;
//     data['password'] = this._password;
//     data['department'] = this._department;
//     data['role'] = this._role;
//     // data['photo'] = this._photo;
//     data['assignment_role'] = this._assignmentRole;
//     data['organization'] = this._organization;
//     data['supervisor'] = this._supervisor;
//     data['column1'] = this._column1;
//     data['column2'] = this._column2;
//     data['column3'] = this._column3;
//     data['column4'] = this._column4;
//     data['column5'] = this._column5;
//     data['column6'] = this._column6;
//     data['column7'] = this._column7;
//     data['column8'] = this._column8;
//     data['column9'] = this._column9;
//     data['column10'] = this._column10;
//     data['column11'] = this._column11;
//     data['column12'] = this._column12;
//     data['org_id'] = this._orgId;
//     data['home'] = this._home;
//     data['approver'] = this._approver;
//     return data;
//   }
// }
class UserInfo {
  String? massage;
  bool? status;
  late Data data;

  UserInfo({this.massage, this.status, required this.data});

  UserInfo.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    status = json['status'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this.massage;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  late int id;
  String? dateCreated;
  String? dateModified;
  String? createdBy;
  String? modifiedBy;
  bool? status;
  late String empCode;
  String? personId;
  String? loginMethod;
  String? termandcondtion;
  String? istemporary;
  late String userName;
  late String firstName;
  late String lastName;
  Null? middleName;
  Null? preferredFirstName;
  Null? preferredLastName;
  Null? salutation;
  Null? initials;
  Null? title;
  Null? suffix;
  Null? displayName;
  Null? formalName;
  Null? birthName;
  Null? namePrefix;
  String? gender;
  Null? maritalStatus;
  String? maritalStatusSince;
  Null? countryOfBirth;
  String? nationality;
  Null? secondNationality;
  Null? nativePreferredLang;
  Null? partnerName;
  Null? partnerNamePrefix;
  Null? note;
  String? dob;
  Null? placeOfBirth;
  String? activeStartDate;
  String? activeEndDate;
  late String email;
  String? password;
  Null? department;
  String? role;
  String? assignmentRole;
  late String organization;
  String? supervisor;
  String? lastLogin;
  Null? recentLogin;
  Null? column1;
  Null? column2;
  Null? column3;
  Null? column4;
  Null? column5;
  Null? column6;
  Null? column7;
  Null? column8;
  Null? column9;
  Null? column10;
  Null? column11;
  Null? column12;
  bool? isVisaDenied;
  String? visaDeniedCountry;
  String? dateOfJoin;
  String? vaccineMasterId;
  String? isVaccineted;
  String? vaccinetedDate;
  Photo? photo;
  late String orgId;
  String? home;
  String? approver;

  Data(
      {required this.id,
      this.dateCreated,
      this.dateModified,
      this.createdBy,
      this.modifiedBy,
      this.status,
      required this.empCode,
      this.personId,
      this.loginMethod,
      this.termandcondtion,
      this.istemporary,
      required this.userName,
      required this.firstName,
      required this.lastName,
      this.middleName,
      this.preferredFirstName,
      this.preferredLastName,
      this.salutation,
      this.initials,
      this.title,
      this.suffix,
      this.displayName,
      this.formalName,
      this.birthName,
      this.namePrefix,
      this.gender,
      this.maritalStatus,
      this.maritalStatusSince,
      this.countryOfBirth,
      this.nationality,
      this.secondNationality,
      this.nativePreferredLang,
      this.partnerName,
      this.partnerNamePrefix,
      this.note,
      this.dob,
      this.placeOfBirth,
      this.activeStartDate,
      this.activeEndDate,
      required this.email,
      this.password,
      this.department,
      this.role,
      this.assignmentRole,
      required this.organization,
      this.supervisor,
      this.lastLogin,
      this.recentLogin,
      this.column1,
      this.column2,
      this.column3,
      this.column4,
      this.column5,
      this.column6,
      this.column7,
      this.column8,
      this.column9,
      this.column10,
      this.column11,
      this.column12,
      this.isVisaDenied,
      this.visaDeniedCountry,
      this.dateOfJoin,
      this.vaccineMasterId,
      this.isVaccineted,
      this.vaccinetedDate,
      this.photo,
      required this.orgId,
      this.home,
      this.approver});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    empCode = json['emp_code'];
    personId = json['person_id'];
    loginMethod = json['login_method'];
    termandcondtion = json['termandcondtion'];
    istemporary = json['istemporary'];
    userName = json['user_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    preferredFirstName = json['preferred_first_name'];
    preferredLastName = json['preferred_last_name'];
    salutation = json['salutation'];
    initials = json['initials'];
    title = json['title'];
    suffix = json['suffix'];
    displayName = json['display_name'];
    formalName = json['formal_name'];
    birthName = json['birth_name'];
    namePrefix = json['name_prefix'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    maritalStatusSince = json['marital_status_since'];
    countryOfBirth = json['country_of_birth'];
    nationality = json['nationality'];
    secondNationality = json['second_nationality'];
    nativePreferredLang = json['native_preferred_lang'];
    partnerName = json['partner_name'];
    partnerNamePrefix = json['partner_name_prefix'];
    note = json['note'];
    dob = json['dob'];
    placeOfBirth = json['place_of_birth'];
    activeStartDate = json['active_start_date'];
    activeEndDate = json['active_end_date'];
    email = json['email'];
    password = json['password'];
    department = json['department'];
    role = json['role'];
    assignmentRole = json['assignment_role'];
    organization = json['organization'];
    supervisor = json['supervisor'];
    lastLogin = json['last_login'];
    recentLogin = json['recent_login'];
    column1 = json['column1'];
    column2 = json['column2'];
    column3 = json['column3'];
    column4 = json['column4'];
    column5 = json['column5'];
    column6 = json['column6'];
    column7 = json['column7'];
    column8 = json['column8'];
    column9 = json['column9'];
    column10 = json['column10'];
    column11 = json['column11'];
    column12 = json['column12'];
    isVisaDenied = json['is_visa_denied'];
    visaDeniedCountry = json['visa_denied_country'];
    dateOfJoin = json['date_of_join'];
    vaccineMasterId = json['vaccine_master_id'];
    isVaccineted = json['is_vaccineted'];
    vaccinetedDate = json['vaccineted_date'];
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    orgId = json['org_id'];
    home = json['home'];
    approver = json['approver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['status'] = this.status;
    data['emp_code'] = this.empCode;
    data['person_id'] = this.personId;
    data['login_method'] = this.loginMethod;
    data['termandcondtion'] = this.termandcondtion;
    data['istemporary'] = this.istemporary;
    data['user_name'] = this.userName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['middle_name'] = this.middleName;
    data['preferred_first_name'] = this.preferredFirstName;
    data['preferred_last_name'] = this.preferredLastName;
    data['salutation'] = this.salutation;
    data['initials'] = this.initials;
    data['title'] = this.title;
    data['suffix'] = this.suffix;
    data['display_name'] = this.displayName;
    data['formal_name'] = this.formalName;
    data['birth_name'] = this.birthName;
    data['name_prefix'] = this.namePrefix;
    data['gender'] = this.gender;
    data['marital_status'] = this.maritalStatus;
    data['marital_status_since'] = this.maritalStatusSince;
    data['country_of_birth'] = this.countryOfBirth;
    data['nationality'] = this.nationality;
    data['second_nationality'] = this.secondNationality;
    data['native_preferred_lang'] = this.nativePreferredLang;
    data['partner_name'] = this.partnerName;
    data['partner_name_prefix'] = this.partnerNamePrefix;
    data['note'] = this.note;
    data['dob'] = this.dob;
    data['place_of_birth'] = this.placeOfBirth;
    data['active_start_date'] = this.activeStartDate;
    data['active_end_date'] = this.activeEndDate;
    data['email'] = this.email;
    data['password'] = this.password;
    data['department'] = this.department;
    data['role'] = this.role;
    data['assignment_role'] = this.assignmentRole;
    data['organization'] = this.organization;
    data['supervisor'] = this.supervisor;
    data['last_login'] = this.lastLogin;
    data['recent_login'] = this.recentLogin;
    data['column1'] = this.column1;
    data['column2'] = this.column2;
    data['column3'] = this.column3;
    data['column4'] = this.column4;
    data['column5'] = this.column5;
    data['column6'] = this.column6;
    data['column7'] = this.column7;
    data['column8'] = this.column8;
    data['column9'] = this.column9;
    data['column10'] = this.column10;
    data['column11'] = this.column11;
    data['column12'] = this.column12;
    data['is_visa_denied'] = this.isVisaDenied;
    data['visa_denied_country'] = this.visaDeniedCountry;
    data['date_of_join'] = this.dateOfJoin;
    data['vaccine_master_id'] = this.vaccineMasterId;
    data['is_vaccineted'] = this.isVaccineted;
    data['vaccineted_date'] = this.vaccinetedDate;
    if (this.photo != null) {
      data['photo'] = this.photo!.toJson();
    }
    data['org_id'] = this.orgId;
    data['home'] = this.home;
    data['approver'] = this.approver;
    return data;
  }
}

class Photo {
  int? id;
  String? dateCreated;
  String? dateModified;
  String? createdBy;
  String? modifiedBy;
  bool? status;
  String? file;

  Photo(
      {this.id,
      this.dateCreated,
      this.dateModified,
      this.createdBy,
      this.modifiedBy,
      this.status,
      this.file});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['status'] = this.status;
    data['file'] = this.file;
    return data;
  }
}
