class ApprovalModal {
  late String massage;
  late bool status;
  late List<ApprovalReq> data;

  ApprovalModal(
      {required this.massage, required this.status, required this.data});

  ApprovalModal.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ApprovalReq>[];
      json['data'].forEach((v) {
        // print('data of v ashish $v');
        // if (v.travelReqStatus != '3') {
        data.add(new ApprovalReq.fromJson(v));
        // }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this.massage;
    data['status'] = this.status;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class ApprovalReq {
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
  late String remark;
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
  late List<VisaRequests> visaRequests;
  late List<Details> details;
  late List<Dependent> dependent;

  ApprovalReq(
      {required this.id,
      required this.isSelected,
      required this.dateCreated,
      required this.dateModified,
      required this.createdBy,
      required this.modifiedBy,
      required this.status,
      required this.travelReqId,
      required this.projectName,
      required this.policyViolations,
      required this.isBillable,
      required this.isTravelMultiCountry,
      required this.isTravelMultiCity,
      required this.requestNotes,
      required this.remark,
      required this.homeContactName,
      required this.homePhoneExt,
      required this.homePhoneNumber,
      required this.isLaptopRequired,
      required this.travelReqStatus,
      required this.travelReqStatusNotes,
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
      required this.column1,
      required this.column2,
      required this.column3,
      required this.column4,
      required this.column5,
      required this.column6,
      required this.column7,
      required this.column8,
      required this.column9,
      required this.column10,
      required this.column11,
      required this.column12,
      required this.empEmail,
      required this.project,
      required this.organization,
      required this.empCode,
      required this.firstName,
      required this.lastName,
      required this.visaRequests,
      required this.details,
      required this.dependent});

  ApprovalReq.fromJson(Map<String, dynamic> json) {
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
    homePhoneNumber = json['home_phone_number'];
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
    if (json['visa_requests'] != null) {
      visaRequests = <VisaRequests>[];
      json['visa_requests'].forEach((v) {
        visaRequests.add(new VisaRequests.fromJson(v));
      });
    }
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
    if (json['dependent'] != null) {
      dependent = <Dependent>[];
      json['dependent'].forEach((v) {
        dependent.add(new Dependent.fromJson(v));
      });
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
    data['dependent'] = this.dependent.map((v) => v.toJson()).toList();
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
  late dynamic id;
  late String travelReqIdId;
  late String travellingCountry;
  late String travellingCountryTo;
  late String officeLocation;
  late String clientNumber;
  late dynamic organization;
  late String sourceCity;
  late String destinationCity;
  late String departureDate;
  late String returnDate;
  late bool isAccmodationRequired;
  late String accmodationStartDate;
  late String accmodationEndDate;
  late String travelPurpose;
  late dynamic assignmentType;
  late String applicableVisa;
  late String visaNumber;
  late String visaExpiryDate;
  late String hostHrName;
  late dynamic hostCountryHead;
  late dynamic hostAttorney;
  late String hostPhoneNo;
  late bool isClientLocation;
  late String clientName;
  late String clientAddress;
  late dynamic hotelCost;
  late dynamic perDiemCost;
  late dynamic airfareCost;
  late dynamic transportationCost;
  late dynamic totalCost;
  late dynamic travelRequestStatus;
  late dynamic travelRequestStatusNotes;
  late bool isDependent;

  Details(
      {required this.id,
      required this.travelReqIdId,
      required this.travellingCountry,
      required this.travellingCountryTo,
      required this.officeLocation,
      required this.clientNumber,
      required this.organization,
      required this.sourceCity,
      required this.destinationCity,
      required this.departureDate,
      required this.returnDate,
      required this.isAccmodationRequired,
      required this.accmodationStartDate,
      required this.accmodationEndDate,
      required this.travelPurpose,
      required this.assignmentType,
      required this.applicableVisa,
      required this.visaNumber,
      required this.visaExpiryDate,
      required this.hostHrName,
      required this.hostCountryHead,
      required this.hostAttorney,
      required this.hostPhoneNo,
      required this.isClientLocation,
      required this.clientName,
      required this.clientAddress,
      required this.hotelCost,
      required this.perDiemCost,
      required this.airfareCost,
      required this.transportationCost,
      required this.totalCost,
      required this.travelRequestStatus,
      required this.travelRequestStatusNotes,
      required this.isDependent});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    travelReqIdId = json['travel_req_id_id'];
    travellingCountry = json['travelling_country'];
    travellingCountryTo = json['travelling_country_to'];
    officeLocation = json['office_location'];
    clientNumber = json['client_number'];
    organization = json['organization'];
    sourceCity = json['source_city'];
    destinationCity = json['destination_city'];
    departureDate = json['departure_date'];
    returnDate = json['return_date'];
    isAccmodationRequired = json['is_accmodation_required'];
    accmodationStartDate = json['accmodation_start_date'];
    accmodationEndDate = json['accmodation_end_date'];
    travelPurpose = json['travel_purpose'];
    assignmentType = json['assignment_type'];
    applicableVisa = json['applicable_visa'];
    visaNumber = json['visa_number'];
    visaExpiryDate = json['visa_expiry_date'];
    hostHrName = json['host_hr_name'];
    hostCountryHead = json['host_country_head'];
    hostAttorney = json['host_attorney'];
    hostPhoneNo = json['host_phone_no'];
    isClientLocation = json['is_client_location'];
    clientName = json['client_name'];
    clientAddress = json['client_address'];
    hotelCost = json['hotel_cost'];
    perDiemCost = json['per_diem_cost'];
    airfareCost = json['airfare_cost'];
    transportationCost = json['transportation_cost'];
    totalCost = json['total_cost'];
    travelRequestStatus = json['travel_request_status'];
    travelRequestStatusNotes = json['travel_request_status_notes'];
    isDependent = json['is_dependent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['travel_req_id_id'] = this.travelReqIdId;
    data['travelling_country'] = this.travellingCountry;
    data['travelling_country_to'] = this.travellingCountryTo;
    data['office_location'] = this.officeLocation;
    data['client_number'] = this.clientNumber;
    data['organization'] = this.organization;
    data['source_city'] = this.sourceCity;
    data['destination_city'] = this.destinationCity;
    data['departure_date'] = this.departureDate;
    data['return_date'] = this.returnDate;
    data['is_accmodation_required'] = this.isAccmodationRequired;
    data['accmodation_start_date'] = this.accmodationStartDate;
    data['accmodation_end_date'] = this.accmodationEndDate;
    data['travel_purpose'] = this.travelPurpose;
    data['assignment_type'] = this.assignmentType;
    data['applicable_visa'] = this.applicableVisa;
    data['visa_number'] = this.visaNumber;
    data['visa_expiry_date'] = this.visaExpiryDate;
    data['host_hr_name'] = this.hostHrName;
    data['host_country_head'] = this.hostCountryHead;
    data['host_attorney'] = this.hostAttorney;
    data['host_phone_no'] = this.hostPhoneNo;
    data['is_client_location'] = this.isClientLocation;
    data['client_name'] = this.clientName;
    data['client_address'] = this.clientAddress;
    data['hotel_cost'] = this.hotelCost;
    data['per_diem_cost'] = this.perDiemCost;
    data['airfare_cost'] = this.airfareCost;
    data['transportation_cost'] = this.transportationCost;
    data['total_cost'] = this.totalCost;
    data['travel_request_status'] = this.travelRequestStatus;
    data['travel_request_status_notes'] = this.travelRequestStatusNotes;
    data['is_dependent'] = this.isDependent;
    return data;
  }
}

class Dependent {
  late dynamic id;
  late String dateCreated;
  late String dateModified;
  late String createdBy;
  late String modifiedBy;
  late bool status;
  late String reqId;
  late String dependentRelation;
  late String dependentName;
  late String dependentPassport;
  late String dependentVisa;
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

  Dependent(
      {required this.id,
      required this.dateCreated,
      required this.dateModified,
      required this.createdBy,
      required this.modifiedBy,
      required this.status,
      required this.reqId,
      required this.dependentRelation,
      required this.dependentName,
      required this.dependentPassport,
      required this.dependentVisa,
      required this.column1,
      required this.column2,
      required this.column3,
      required this.column4,
      required this.column5,
      required this.column6,
      required this.column7,
      required this.column8,
      required this.column9,
      required this.column10,
      required this.column11,
      required this.column12,
      required this.travelReqId,
      required this.organization});

  Dependent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    reqId = json['req_id'];
    dependentRelation = json['dependent_relation'];
    dependentName = json['dependent_name'];
    dependentPassport = json['dependent_passport'];
    dependentVisa = json['dependent_visa'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['status'] = this.status;
    data['req_id'] = this.reqId;
    data['dependent_relation'] = this.dependentRelation;
    data['dependent_name'] = this.dependentName;
    data['dependent_passport'] = this.dependentPassport;
    data['dependent_visa'] = this.dependentVisa;
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
    return data;
  }
}
