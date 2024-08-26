class PostDocModel {
 late String _docName;
 late String _docDescription;
 late String _documentUrl;
 late String _empCode;
 late String _vaultType;

  PostDocModel(
      { required String docName,
        required String docDescription,
        required String documentUrl,
        required String empCode,
        required String vaultType}) {
    this._docName = docName;
    this._docDescription = docDescription;
    this._documentUrl = documentUrl;
    this._empCode = empCode;
    this._vaultType = vaultType;
  }

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

  PostDocModel.fromJson(Map<String, dynamic> json) {
    _docName = json['doc_name'];
    _docDescription = json['doc_description'];
    _documentUrl = json['document_url'];
    _empCode = json['emp_code'];
    _vaultType = json['vault_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_name'] = this._docName;
    data['doc_description'] = this._docDescription;
    data['document_url'] = this._documentUrl;
    data['emp_code'] = this._empCode;
    data['vault_type'] = this._vaultType;
    return data;
  }
}