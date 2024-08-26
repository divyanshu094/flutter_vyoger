class ComplianceQuestion {
  late String _complQues;
  late bool _complAns;
  late String _empCode;

  ComplianceQuestion({required String complQues, required bool complAns, required String empCode}) {
    this._complQues = complQues;
    this._complAns = complAns;
    this._empCode = empCode;
  }

  String get complQues => _complQues;
  set complQues(String complQues) => _complQues = complQues;
  bool get complAns => _complAns;
  set complAns(bool complAns) => _complAns = complAns;
  String get empCode => _empCode;
  set empCode(String empCode) => _empCode = empCode;

  ComplianceQuestion.fromJson(Map<String, dynamic> json) {
    _complQues = json['compl_ques'];
    _complAns = json['compl_ans'];
    _empCode = json['emp_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compl_ques'] = this._complQues;
    data['compl_ans'] = this._complAns;
    data['emp_code'] = this._empCode;
    return data;
  }
}