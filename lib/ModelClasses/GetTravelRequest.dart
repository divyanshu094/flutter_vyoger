import 'CurrencyConversionModel.dart';

class GetTravelRequest {
  late String massage;
  late bool status;
  late MyModelData data;

  GetTravelRequest(
      {required this.massage, required this.status, required this.data});

  GetTravelRequest.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    status = json['status'];
    data =
        (json['data'] != null ? new MyModelData.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this.massage;
    data['status'] = this.status;
    data['data'] = this.data.toJson();
    return data;
  }
}

class MyModelData {
  late dynamic id;
  late bool isSelected = false;
  late String dateCreated;
  late String dateModified;
  late String createdBy;
  late String modifiedBy;
  late bool status;
  late String travelReqId;
  late String projectName;
  late dynamic policyViolations;
  late bool isBillable;
  late bool isTravelMultiCountry;
  late bool isTravelMultiCity;
  late dynamic requestNotes;
  String? remark;
  late String homeContactName;
  late String homePhoneExt;
  late String homePhoneNumber;
  late bool isLaptopRequired;
  late String travelReqStatus;
  late dynamic travelReqStatusNotes;
  late String currentTicketOwner;
  late String supervisor;
  late String expenseApprover;
  late String projectManager;
  late String businessLead;
  late String clientExecutiveLead;
  late bool haveLaptop;
  late String approvalLevel;
  late String expenceCureency;
  late String expenceDepartureDate;
  late String expenceEstimatedCost;
  late String expenceFromCountry;
  late String expenceReturnDate;
  late String expenceToCountry;
  late dynamic column1;
  late dynamic column2;
  late dynamic column3;
  late dynamic column4;
  late dynamic column5;
  late dynamic column6;
  late dynamic column7;
  late dynamic column8;
  late dynamic column9;
  late dynamic column10;
  late dynamic column11;
  late dynamic column12;
  late String empEmail;
  late String project;
  late String organization;
  late String empCode;
  late String firstName;
  late String lastName;
  late List<Details> details;
  late List<Dependent> dependent;
  late List<VisaRequests> visaRequests;

  MyModelData(
      {this.id,
      required this.isSelected,
      required this.dateCreated,
      required this.dateModified,
      required this.createdBy,
      required this.modifiedBy,
      required this.status,
      required this.travelReqId,
      required this.projectName,
      this.policyViolations,
      required this.isBillable,
      required this.isTravelMultiCountry,
      required this.isTravelMultiCity,
      this.requestNotes,
      this.remark,
      required this.homeContactName,
      required this.homePhoneExt,
      required this.homePhoneNumber,
      required this.isLaptopRequired,
      required this.travelReqStatus,
      this.travelReqStatusNotes,
      required this.currentTicketOwner,
      required this.supervisor,
      required this.expenseApprover,
      required this.projectManager,
      required this.businessLead,
      required this.clientExecutiveLead,
      required this.haveLaptop,
      required this.approvalLevel,
      required this.expenceCureency,
      required this.expenceDepartureDate,
      required this.expenceEstimatedCost,
      required this.expenceFromCountry,
      required this.expenceReturnDate,
      required this.expenceToCountry,
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
      required this.empEmail,
      required this.project,
      required this.organization,
      required this.empCode,
      required this.firstName,
      required this.lastName,
      required this.details,
      required this.visaRequests,
      required this.dependent});

  MyModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    travelReqId = json['travel_req_id'];
    projectName = json['project_name'];
    policyViolations = json['policy_violations'];
    isBillable = json['is_billable'];
    isTravelMultiCountry = json['is_travel_multi_country'];
    isTravelMultiCity = json['is_travel_multi_city'];
    requestNotes = json['request_notes'];
    remark = json['remark'];
    homeContactName = json['home_contact_name'];
    homePhoneExt = json['home_phone_ext'];
    homePhoneNumber = json['home_phone_number'] ?? "";
    isLaptopRequired = json['is_laptop_required'];
    travelReqStatus = json['travel_req_status'];
    travelReqStatusNotes = json['travel_req_status_notes'];
    currentTicketOwner = json['current_ticket_owner'];
    supervisor = json['supervisor'];
    expenseApprover = json['expense_approver'];
    projectManager = json['project_manager'];
    businessLead = json['business_lead'];
    clientExecutiveLead = json['client_executive_lead'];
    haveLaptop = json['have_laptop'];
    approvalLevel = json['approval_level'];
    expenceCureency = json['expence_cureency'];
    expenceDepartureDate = json['expence_departureDate'];
    expenceEstimatedCost = json['expence_estimatedCost'];
    expenceFromCountry = json['expence_fromCountry'];
    expenceReturnDate = json['expence_returnDate'];
    expenceToCountry = json['expence_toCountry'];
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
    empEmail = json['emp_email'];
    project = json['project'];
    organization = json['organization'];
    empCode = json['emp_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
    if (json['dependents'] != null) {
      dependent = <Dependent>[];
      json['dependents'].forEach((v) {
        dependent.add(new Dependent.fromJson(v));
      });
    }
    if (json['visa_requests'] != null) {
      if (json['visa_requests'] == "") {
        visaRequests = [];
      } else {
        visaRequests = <VisaRequests>[];
        json['visa_requests'].forEach((v) {
          visaRequests.add(new VisaRequests.fromJson(v));
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['status'] = this.status;
    data['travel_req_id'] = this.travelReqId;
    data['project_name'] = this.projectName;
    data['policy_violations'] = this.policyViolations;
    data['is_billable'] = this.isBillable;
    data['is_travel_multi_country'] = this.isTravelMultiCountry;
    data['is_travel_multi_city'] = this.isTravelMultiCity;
    data['request_notes'] = this.requestNotes;
    data['remark'] = this.remark;
    data['home_contact_name'] = this.homeContactName;
    data['home_phone_ext'] = this.homePhoneExt;
    data['home_phone_number'] = this.homePhoneNumber;
    data['is_laptop_required'] = this.isLaptopRequired;
    data['travel_req_status'] = this.travelReqStatus;
    data['travel_req_status_notes'] = this.travelReqStatusNotes;
    data['current_ticket_owner'] = this.currentTicketOwner;
    data['supervisor'] = this.supervisor;
    data['expense_approver'] = this.expenseApprover;
    data['project_manager'] = this.projectManager;
    data['business_lead'] = this.businessLead;
    data['client_executive_lead'] = this.clientExecutiveLead;
    data['have_laptop'] = this.haveLaptop;
    data['approval_level'] = this.approvalLevel;
    data['expence_cureency'] = this.expenceCureency;
    data['expence_departureDate'] = this.expenceDepartureDate;
    data['expence_estimatedCost'] = this.expenceEstimatedCost;
    data['expence_fromCountry'] = this.expenceFromCountry;
    data['expence_returnDate'] = this.expenceReturnDate;
    data['expence_toCountry'] = this.expenceToCountry;
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
    data['emp_email'] = this.empEmail;
    data['project'] = this.project;
    data['organization'] = this.organization;
    data['emp_code'] = this.empCode;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['details'] = this.details.map((v) => v.toJson()).toList();
    data['dependents'] = this.dependent.map((v) => v.toJson()).toList();
    data['visa_requests'] = this.visaRequests.map((v) => v.toJson()).toList();
    return data;
  }
}

class VisaRequests {
  late String visaReqId;

  VisaRequests({required this.visaReqId});

  VisaRequests.fromJson(Map<String, dynamic> json) {
    visaReqId = json['visa_req_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visa_req_id'] = this.visaReqId;
    return data;
  }
}

class Details {
  late Currency_Data currency_data;
  late double currencyTotal = 0.0;
  late int id;
  late String dateCreated;
  late String dateModified;
  late String createdBy;
  late String modifiedBy;
  late bool status;
  late String travellingCountry;
  late String travellingCountryTo;
  String? officeLocation;
  late String clientNumberExt;
  late dynamic clientNumber;
  late String sourceCity;
  late String destinationCity;
  late String departureDate;
  late String returnDate;
  late bool isAccmodationRequired;
  late String accmodationStartDate;
  late String accmodationEndDate;
  late String travelPurpose;
  late dynamic applicableVisa;
  late String visaNumber;
  late String visaExpiryDate;
  late String hostHrName;
  late dynamic hostCountryHead;
  late dynamic hostAttorney;
  late String hostPhoneExt;
  late String hostPhoneNo;
  late bool isClientLocation;
  late dynamic clientName;
  late dynamic clientAddress;
  late dynamic hotelCost;
  late dynamic perDiemCost;
  late dynamic airfareCost;
  late dynamic transportationCost;
  late dynamic totalCost;
  late String currency;
  late dynamic reportingCurrency;
  late dynamic travelRequestStatus;
  late dynamic travelRequestStatusNotes;
  late bool isDependent;
  late dynamic agenda;
  late dynamic column1;
  late dynamic column2;
  late dynamic column3;
  late dynamic column4;
  late dynamic column5;
  late dynamic column6;
  late dynamic column7;
  late dynamic column8;
  late dynamic column9;
  late dynamic column10;
  late dynamic column11;
  late dynamic column12;
  late String travelReqId;
  late dynamic organization;
  late dynamic assignmentType;

  double get currencyTotalData => currencyTotal;

  set currencyTotalData(double value) {
    currencyTotal = value;
  }

  Currency_Data get currency_dataset => currency_data;

  set currency_dataset(Currency_Data value) {
    currency_data = value;
  }

  Details(
      {required this.id,
      required this.dateCreated,
      required this.dateModified,
      required this.createdBy,
      required this.modifiedBy,
      required this.status,
      required this.travellingCountry,
      required this.travellingCountryTo,
      this.officeLocation,
      required this.clientNumberExt,
      this.clientNumber,
      required this.sourceCity,
      required this.destinationCity,
      required this.departureDate,
      required this.returnDate,
      required this.isAccmodationRequired,
      required this.accmodationStartDate,
      required this.accmodationEndDate,
      required this.travelPurpose,
      this.applicableVisa,
      required this.visaNumber,
      required this.visaExpiryDate,
      required this.hostHrName,
      this.hostCountryHead,
      this.hostAttorney,
      required this.hostPhoneExt,
      required this.hostPhoneNo,
      required this.isClientLocation,
      this.clientName,
      this.clientAddress,
      this.hotelCost,
      this.perDiemCost,
      this.airfareCost,
      this.transportationCost,
      this.totalCost,
      required this.currency,
      this.reportingCurrency,
      this.travelRequestStatus,
      this.travelRequestStatusNotes,
      required this.isDependent,
      this.agenda,
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
      required this.travelReqId,
      this.organization,
      required this.currency_data,
      required this.currencyTotal,
      this.assignmentType});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    travellingCountry = json['travelling_country'];
    travellingCountryTo = json['travelling_country_to'];
    officeLocation = json['office_location'];
    clientNumberExt = json['client_number_ext'];
    clientNumber = json['client_number'];
    sourceCity = json['source_city'];
    destinationCity = json['destination_city'];
    departureDate = json['departure_date'];
    returnDate = json['return_date'];
    isAccmodationRequired = json['is_accmodation_required'];
    accmodationStartDate = json['accmodation_start_date'];
    accmodationEndDate = json['accmodation_end_date'];
    travelPurpose = json['travel_purpose'];
    applicableVisa = json['applicable_visa'];
    visaNumber = json['visa_number'];
    visaExpiryDate = json['visa_expiry_date'];
    hostHrName = json['host_hr_name'];
    hostCountryHead = json['host_country_head'];
    hostAttorney = json['host_attorney'];
    hostPhoneExt = json['host_phone_ext'];
    hostPhoneNo = json['host_phone_no'];
    isClientLocation = json['is_client_location'];
    clientName = json['client_name'];
    clientAddress = json['client_address'];
    hotelCost = json['hotel_cost'];
    perDiemCost = json['per_diem_cost'];
    airfareCost = json['airfare_cost'];
    transportationCost = json['transportation_cost'];
    totalCost = json['total_cost'];
    currency = json['currency'];
    reportingCurrency = json['reporting_currency'];
    travelRequestStatus = json['travel_request_status'];
    travelRequestStatusNotes = json['travel_request_status_notes'];
    isDependent = json['is_dependent'];
    agenda = json['agenda'];
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
    travelReqId = json['travel_req_id'];
    organization = json['organization'];
    assignmentType = json['assignment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['status'] = this.status;
    data['travelling_country'] = this.travellingCountry;
    data['travelling_country_to'] = this.travellingCountryTo;
    data['office_location'] = this.officeLocation;
    data['client_number_ext'] = this.clientNumberExt;
    data['client_number'] = this.clientNumber;
    data['source_city'] = this.sourceCity;
    data['destination_city'] = this.destinationCity;
    data['departure_date'] = this.departureDate;
    data['return_date'] = this.returnDate;
    data['is_accmodation_required'] = this.isAccmodationRequired;
    data['accmodation_start_date'] = this.accmodationStartDate;
    data['accmodation_end_date'] = this.accmodationEndDate;
    data['travel_purpose'] = this.travelPurpose;
    data['applicable_visa'] = this.applicableVisa;
    data['visa_number'] = this.visaNumber;
    data['visa_expiry_date'] = this.visaExpiryDate;
    data['host_hr_name'] = this.hostHrName;
    data['host_country_head'] = this.hostCountryHead;
    data['host_attorney'] = this.hostAttorney;
    data['host_phone_ext'] = this.hostPhoneExt;
    data['host_phone_no'] = this.hostPhoneNo;
    data['is_client_location'] = this.isClientLocation;
    data['client_name'] = this.clientName;
    data['client_address'] = this.clientAddress;
    data['hotel_cost'] = this.hotelCost;
    data['per_diem_cost'] = this.perDiemCost;
    data['airfare_cost'] = this.airfareCost;
    data['transportation_cost'] = this.transportationCost;
    data['total_cost'] = this.totalCost;
    data['currency'] = this.currency;
    data['reporting_currency'] = this.reportingCurrency;
    data['travel_request_status'] = this.travelRequestStatus;
    data['travel_request_status_notes'] = this.travelRequestStatusNotes;
    data['is_dependent'] = this.isDependent;
    data['agenda'] = this.agenda;
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
    data['travel_req_id'] = this.travelReqId;
    data['organization'] = this.organization;
    data['assignment_type'] = this.assignmentType;
    return data;
  }
}

class Dependent {
  late int _id;
  late String _dateCreated;
  late String _dateModified;
  late String _createdBy;
  late String _modifiedBy;
  late bool _status;
  late String _reqId;
  late String _dependentRelation;
  late String _dependentName;
  late String _dependentPassport;
  late String _dependentVisa;
  late Null _column1;
  late Null _column2;
  late Null _column3;
  late Null _column4;
  late Null _column5;
  late Null _column6;
  late Null _column7;
  late Null _column8;
  late Null _column9;
  late Null _column10;
  late Null _column11;
  late Null _column12;
  late String _travelReqId;
  late Null _organization;

  Dependent(
     {required int id,
      required String dateCreated,
      required String dateModified,
      required String createdBy,
      required String modifiedBy,
      required bool status,
      required String reqId,
      required String dependentRelation,
      required String dependentName,
      required String dependentPassport,
      required String dependentVisa,
      Null column1,
      Null column2,
      Null column3,
      Null column4,
      Null column5,
      Null column6,
      Null column7,
      Null column8,
      Null column9,
      Null column10,
      Null column11,
      Null column12,
      required String travelReqId,
      Null organization}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._reqId = reqId;
    this._dependentRelation = dependentRelation;
    this._dependentName = dependentName;
    this._dependentPassport = dependentPassport;
    this._dependentVisa = dependentVisa;
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
    this._travelReqId = travelReqId;
    this._organization = organization;
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

  String get reqId => _reqId;

  set reqId(String reqId) => _reqId = reqId;

  String get dependentRelation => _dependentRelation;

  set dependentRelation(String dependentRelation) =>
      _dependentRelation = dependentRelation;

  String get dependentName => _dependentName;

  set dependentName(String dependentName) => _dependentName = dependentName;

  String get dependentPassport => _dependentPassport;

  set dependentPassport(String dependentPassport) =>
      _dependentPassport = dependentPassport;

  String get dependentVisa => _dependentVisa;

  set dependentVisa(String dependentVisa) => _dependentVisa = dependentVisa;

  dynamic get column1 => _column1;

  set column1(dynamic column1) => _column1 = column1;

  dynamic get column2 => _column2;

  set column2(dynamic column2) => _column2 = column2;

  dynamic get column3 => _column3;

  set column3(dynamic column3) => _column3 = column3;

  dynamic get column4 => _column4;

  set column4(dynamic column4) => _column4 = column4;

  dynamic get column5 => _column5;

  set column5(dynamic column5) => _column5 = column5;

  dynamic get column6 => _column6;

  set column6(dynamic column6) => _column6 = column6;

  dynamic get column7 => _column7;

  set column7(dynamic column7) => _column7 = column7;

  dynamic get column8 => _column8;

  set column8(dynamic column8) => _column8 = column8;

  dynamic get column9 => _column9;

  set column9(dynamic column9) => _column9 = column9;

  dynamic get column10 => _column10;

  set column10(dynamic column10) => _column10 = column10;

  dynamic get column11 => _column11;

  set column11(dynamic column11) => _column11 = column11;

  dynamic get column12 => _column12;

  set column12(dynamic column12) => _column12 = column12;

  String get travelReqId => _travelReqId;

  set travelReqId(String travelReqId) => _travelReqId = travelReqId;

  dynamic get organization => _organization;

  set organization(dynamic organization) => _organization = organization;

  Dependent.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _reqId = json['req_id'];
    _dependentRelation = json['dependent_relation'];
    _dependentName = json['dependent_name'];
    _dependentPassport = json['dependent_passport'];
    _dependentVisa = json['dependent_visa'];
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
    _travelReqId = json['travel_req_id'];
    _organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['status'] = this._status;
    data['req_id'] = this._reqId;
    data['dependent_relation'] = this._dependentRelation;
    data['dependent_name'] = this._dependentName;
    data['dependent_passport'] = this._dependentPassport;
    data['dependent_visa'] = this._dependentVisa;
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
    data['travel_req_id'] = this._travelReqId;
    data['organization'] = this._organization;
    return data;
  }
}
