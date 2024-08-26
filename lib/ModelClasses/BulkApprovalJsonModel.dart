class BulkApprovalJson {
  late String _approvalLevel;
  late String _approveAction;
  late String _currentTicketOwner;
  late String _modifiedBy;
  late String _module;
  late String _orgId;
  late String _requestNotes;
  late String _takeOwnership;
  late String _transferTo;
  late String _travelReqId;

  BulkApprovalJson(
      {required String approvalLevel,
      required String approveAction,
      required String currentTicketOwner,
      required String modifiedBy,
      required String module,
      required String orgId,
      required String requestNotes,
      required String takeOwnership,
      required String transferTo,
      required String travelReqId}) {
    this._approvalLevel = approvalLevel;
    this._approveAction = approveAction;
    this._currentTicketOwner = currentTicketOwner;
    this._modifiedBy = modifiedBy;
    this._module = module;
    this._orgId = orgId;
    this._requestNotes = requestNotes;
    this._takeOwnership = takeOwnership;
    this._transferTo = transferTo;
    this._travelReqId = travelReqId;
  }

  String get approvalLevel => _approvalLevel;

  set approvalLevel(String approvalLevel) => _approvalLevel = approvalLevel;

  String get approveAction => _approveAction;

  set approveAction(String approveAction) => _approveAction = approveAction;

  String get currentTicketOwner => _currentTicketOwner;

  set currentTicketOwner(String currentTicketOwner) =>
      _currentTicketOwner = currentTicketOwner;

  String get modifiedBy => _modifiedBy;

  set modifiedBy(String modifiedBy) => _modifiedBy = modifiedBy;

  String get module => _module;

  set module(String module) => _module = module;

  String get orgId => _orgId;

  set orgId(String orgId) => _orgId = orgId;

  String get requestNotes => _requestNotes;

  set requestNotes(String requestNotes) => _requestNotes = requestNotes;

  String get takeOwnership => _takeOwnership;

  set takeOwnership(String takeOwnership) => _takeOwnership = takeOwnership;

  String get transferTo => _transferTo;

  set transferTo(String transferTo) => _transferTo = transferTo;

  String get travelReqId => _travelReqId;

  set travelReqId(String travelReqId) => _travelReqId = travelReqId;

  BulkApprovalJson.fromJson(Map<String, dynamic> json) {
    _approvalLevel = json['approval_level'];
    _approveAction = json['approve_action'];
    _currentTicketOwner = json['current_ticket_owner'];
    _modifiedBy = json['modified_by'];
    _module = json['module'];
    _orgId = json['org_id'];
    _requestNotes = json['request_notes'];
    _takeOwnership = json['take_ownership'];
    _transferTo = json['transfer_to'];
    _travelReqId = json['travel_req_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approval_level'] = this._approvalLevel;
    data['approve_action'] = this._approveAction;
    data['current_ticket_owner'] = this._currentTicketOwner;
    data['modified_by'] = this._modifiedBy;
    data['module'] = this._module;
    data['org_id'] = this._orgId;
    data['request_notes'] = this._requestNotes;
    data['take_ownership'] = this._takeOwnership;
    data['transfer_to'] = this._transferTo;
    data['travel_req_id'] = this._travelReqId;
    return data;
  }
}
