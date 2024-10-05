import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/ActionHistoryModel.dart';
import 'package:mobility_sqr/ModelClasses/Activities.dart';
import 'package:mobility_sqr/ModelClasses/Approval.dart';
import 'package:mobility_sqr/ModelClasses/BulkApprovalJsonModel.dart';
import 'package:mobility_sqr/ModelClasses/CalenderResponseModel.dart';
import 'package:mobility_sqr/ModelClasses/ChangePassPayload.dart';
import 'package:mobility_sqr/ModelClasses/ChangePasswordResponse.dart';
import 'package:mobility_sqr/ModelClasses/CheckUser.dart';
import 'package:mobility_sqr/ModelClasses/ComplianceModel.dart';
import 'package:mobility_sqr/ModelClasses/ComplianceResponse.dart';
import 'package:mobility_sqr/ModelClasses/CountryCodeModel.dart';
import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';
import 'package:mobility_sqr/ModelClasses/CurrencyConversionModel.dart';
import 'package:mobility_sqr/ModelClasses/CurrencyResultModel.dart';
import 'package:mobility_sqr/ModelClasses/DependentModel.dart';
import 'package:mobility_sqr/ModelClasses/DocumentModelClass.dart';
import 'package:mobility_sqr/ModelClasses/EmergencyContactModel.dart';
import 'package:mobility_sqr/ModelClasses/ForgetPassModel.dart';
import 'package:mobility_sqr/ModelClasses/GenderModel.dart';
import 'package:mobility_sqr/ModelClasses/GetTravelRequest.dart';
import 'package:mobility_sqr/ModelClasses/GetVisaModelClass.dart';
import 'package:mobility_sqr/ModelClasses/Get_Post_Location.dart';
import 'package:mobility_sqr/ModelClasses/MaritalModel.dart';
import 'package:mobility_sqr/ModelClasses/NewEmergencyModel.dart';
import 'package:mobility_sqr/ModelClasses/NotificationModel.dart';
import 'package:mobility_sqr/ModelClasses/PassportModel.dart';
import 'package:mobility_sqr/ModelClasses/PassportforModel.dart';
import 'package:mobility_sqr/ModelClasses/PerDiemModelClass.dart';
import 'package:mobility_sqr/ModelClasses/ProjectIdModel.dart';
import 'package:mobility_sqr/ModelClasses/PurposeModelClass.dart';
import 'package:mobility_sqr/ModelClasses/RelationList.dart';
import 'package:mobility_sqr/ModelClasses/SearchModelClass.dart';
import 'package:mobility_sqr/ModelClasses/SubmitRequestFResponse.dart';
import 'package:mobility_sqr/ModelClasses/SubmitRequestForApprovalModel.dart';
import 'package:mobility_sqr/ModelClasses/SubmitResponseQuestions.dart';
import 'package:mobility_sqr/ModelClasses/TravelReqResponse.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/ModelClasses/UserInfoPayload.dart';
import 'package:mobility_sqr/ModelClasses/UserProfileModel.dart';
import 'package:mobility_sqr/ModelClasses/UserToken.dart';
import 'package:mobility_sqr/ModelClasses/VisaModel.dart';
import 'package:mobility_sqr/ModelClasses/eventPost.dart';

import '../Constants/AppConstants.dart';
import '../ModelClasses/DialCodeModel.dart';

class ApiProvider {
  final _TokenGetter = TokenGetter();

  // final ioc = new HttpClient();
  // ioc.badCertificateCallback =(X509Certificate cert, String host, int port) => true;
  // final http = new IOClient(ioc);
  Future<bool> CheckUserdata(String username) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    print('user email response 1');
    Map<String, String> queryParams = {
      'user_name': username,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    print(
        'new url ${AppConstants.BASE_URL + AppConstants.CHECK_USER + "?" + queryString} ');
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.CHECK_USER + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print('user email response  ${response.body}');

    if (response.statusCode == 200) {
      CheckUser data = CheckUser.fromJson(jsonDecode(response.body));

      if (data.isUser == 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

//==================================================================================================
  Future<UserToken> postRequest(String username, String password) async {
    Map data = {"username": username, "password": password};
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.ACCESS_TOKEN_FETCHER),
        headers: {"Content-Type": "application/json"},
        body: body);
    UserToken userToken = UserToken.fromJson(jsonDecode(response.body));
    print("bfbfds ${response.statusCode}");
    print("${response.body}");
    return userToken;
  }

  //================================================================================================
  Future<UserInfo> getUserData(String username, String token) async {
    Map data = {"email": username.trim()};
    //encode Map to JSON
    var body = json.encode(data);
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    // String token = await _TokenGetter.getAcessToken() ?? "";
    // String token = await getToken_byReresh();
    var response = await http.post(
      Uri.parse(AppConstants.BASE_URL + AppConstants.GET_USER_INFO),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: body,
    );
    UserInfo userToken = UserInfo.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return userToken;
  }

//=====================================================================================================
  Future<ForgetPassModel> resetPass(String email) async {
    Map data = {"email": email};
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
      Uri.parse(AppConstants.BASE_URL + AppConstants.FORGET_PASS),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: body,
    );
    ForgetPassModel passModel =
        ForgetPassModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return passModel;
  }

//=======================================================================================================
  Future<ApprovalModal> getTravelRequest() async {
    print('aprovals get data check');
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    // getDialCode();

    String travelreq = "2";
    String OrgId = userInfo.data.orgId;
    String empMail = userInfo.data.empCode;

    Map<String, String> queryParams = {
      'travel_req_status': "",
      'org_id': OrgId,
      'emp_email': empMail
    };
    String queryString = Uri(queryParameters: queryParams).query;

    //   String token = await _TokenGetter.getAcessToken() ?? "";
    String token = await getToken_byReresh();
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL +
          AppConstants.GET_TRAVEL_REQ +
          "?" +
          queryString),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    print('aprovals get data ${response.body}');
    Map<String, dynamic> a = jsonDecode(response.body);
    ApprovalModal listTravelReq = ApprovalModal.fromJson(a);
    print("${response.statusCode}");
    print("${response.body}");
    return listTravelReq;
  }

//========================================================================================================
  Future<SearchModel> getLocation(String locationName) async {
    String token = await getToken_byReresh();
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      'city': locationName,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL +
          AppConstants.GET_LOCATION_DATA +
          "?" +
          queryString),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      SearchModel data = SearchModel.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('User Not Found');
    }
  }

//===========================================================================================================
  getToken_byReresh() async {
    String refresh_token = await _TokenGetter.getRefreshToken() ?? "";
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map data = {"refresh": refresh_token};
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.Token_GETTER),
        headers: {"Content-Type": "application/json"},
        body: body);
    Map<String, dynamic> userToken = jsonDecode(response.body);
    String token = userToken["access"];
    print("${token}");
    _TokenGetter.saveValue(token, refresh_token);
    print("${response.statusCode}");
    print("${response.body}");

    return token;
  }

//======================================================================================================
  Future<PurposeModelClass> getPurposeList(String iata) async {
    String token = await getToken_byReresh();
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    String OrgId = userInfo.data.orgId;
    Map<String, String> queryParams = {
      'country_id': '$iata',
      'organization': OrgId
    };
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          AppConstants.BASE_URL + AppConstants.GET_PURPOSE + "?" + queryString),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      PurposeModelClass data =
          PurposeModelClass.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('User Not Found');
    }
  }

//=============================================================================================================
  Future<DialCode> getDialCode() async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL + AppConstants.DIAL_CODE + "?dial_code="),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      DialCode data = DialCode.fromJson(jsonDecode(response.body));
      List<String> dialString = <String>[];
      for (int i = 0; i < data.data.length; i++) {
        dialString.add(data.data[i].code);
      }
      _TokenGetter.saveDialCode(dialString);
    }
    throw Exception('User Not Found');
  }

//========================================================================================================================
  Future<ProjectIdModel> GetProjectId(String pid) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      'pid': pid,
      'limit': '15',
      'org_id': userInfo.data.orgId
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.GET_PROJECT + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      ProjectIdModel data = ProjectIdModel.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('User Not Found');
    }
  }

//========================================================================================================================
  Future<PostLocationResponse> GetPostLocation(String country) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      'country': country,
      'org_id': userInfo.data.orgId
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.GET_POST_LOCATION + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      PostLocationResponse data =
          PostLocationResponse.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<List<SecondDependentData>> GetDependentList(String country) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      'country': country,
      'employee': userInfo.data.empCode
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.Get_DEPENDENTS + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      DependentModel myresponse =
          DependentModel.fromJson(jsonDecode(response.body));

      return myresponse.data;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<PerDiemModel> GetPerDiem(String country, String homeCountry) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    String OrgId = userInfo.data.orgId;
    Map<String, String> queryParams = {
      'country': country,
      'home_country': homeCountry,
      'organization': OrgId,
    };

    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.GET_PER_DIEM + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      PerDiemModelClass myresponse =
          PerDiemModelClass.fromJson(jsonDecode(response.body));

      return myresponse.data;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<GetVisaModel> GetTravelVisa(
      String visaType, String visaCountryId) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      "emp_code_id": userInfo.data.empCode,
      "visa_country_id": visaCountryId,
      "visa_type": visaType
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.GET_EMPLYOEE_VISA + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      GetVisaModel myresponse =
          GetVisaModel.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<TravelReqResponseModel> PostTravelRequest(var data) async {
    //encode Map to JSON
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    String token = await getToken_byReresh();
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.POST_TRAVEL_REQ),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: data);
    if (response.statusCode == 200) {
      TravelReqResponseModel travelReqResponse =
          TravelReqResponseModel.fromJson(jsonDecode(response.body));

      return travelReqResponse;
    } else {
      throw Exception('failed');
      // if (response.statusCode == 500) {
      //   print("errr");
      // } else {
      //
      // }
    }
  }

//========================================================================================================================
  Future<ApprovalModal> fetch_approval_list() async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      "emp_email": userInfo.data.empCode,
      "travel_req_status": "2",
      "type": "Travel",
      "org_id": userInfo.data.orgId
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.GET_APPROVAL_LIST + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      ApprovalModal myresponse =
          ApprovalModal.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<SubmitRequestFResponse> Post_Travel_Req_For_Approval(
      SubmitRequestForApprovalModel model) async {
    //encode Map to JSON
    var body = json.encode(model.toJson());
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    print(body);
    String token = await getToken_byReresh();
    var response = await http.post(
      Uri.parse(AppConstants.BASE_URL + AppConstants.POST_REQUEST_FOR_APPROVAL),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: body,
    );
    print("${response.statusCode}");
    print("${response.body}");

    if (response.statusCode == 200) {
      SubmitRequestFResponse myresponse =
          SubmitRequestFResponse.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================

  Future<ActionHistoryModel> get_travel_status_summary(
      String travelreqId) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      "travel_req_id": travelreqId,
      "org_id": userInfo.data.orgId
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.ACTION_HISTORY_SUMMARY + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      ActionHistoryModel myresponse =
          ActionHistoryModel.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<GetTravelRequest> fetchViewTravelReq(String TravelReqId) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      "travel_req_id": TravelReqId,
      "org_id": userInfo.data.orgId
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.GET_TRAVEL_REQ_VIEW + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      GetTravelRequest myresponse =
          GetTravelRequest.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<CurrencyConversionModel> get_currency_active() async {
    Map<String, String> queryParams = {
      "status_type": "Active",
    };
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.GET_CURRENCY_ACTIVE + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      CurrencyConversionModel myresponse =
          CurrencyConversionModel.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

  //========================================================================================================================
  Future<CurrencyResultModel> get_currency_conversion(
      String from_currency, String to_currency) async {
    Map<String, String> queryParams = {
      "from_currency": from_currency,
      "to_currency": to_currency
    };
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.GET_CURRENCY_CONVERSION + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      CurrencyResultModel myresponse =
          CurrencyResultModel.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

  //=============================================================================================
  Future<CountryListModel> getCountrylist({required String countryId}) async {
    String token = await getToken_byReresh();

    Map<String, String> queryParams = {
      'country': countryId,
    };
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.GET_COUNTRY_LIST + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      CountryListModel data =
          CountryListModel.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('Server Error');
    }
  }

  Future<Marital> getMaritallist() async {
    String token = await getToken_byReresh();
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      'organization_id': userInfo.data.orgId,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    var uri =
        '${AppConstants.BASE_URL + AppConstants.GET_MARITAL + "?" + queryString}';
    // print('marital api ur  $uri');
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.GET_MARITAL + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    // print('get marital response  ${response.body}');
    if (response.statusCode == 200) {
      Marital data = Marital.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('Server Error');
    }
  }

  Future<Gender> getGenderlist() async {
    String token = await getToken_byReresh();
    // UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;

    // Map<String, String> queryParams = {
    //   'organization_id': userInfo.data.orgId,
    // };
    // String queryString = Uri(queryParameters: queryParams).query;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var response = await http.get(
      Uri.parse('${AppConstants.BASE_URL + AppConstants.GET_POST_GENDER}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    // print('get gender response  ${response.body}');
    if (response.statusCode == 200) {
      Gender data = Gender.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('Server Error');
    }
  }

  Future<Countrycode> getCountryCodelist() async {
    String token = await getToken_byReresh();
    // UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      'dial_code': '',
    };
    String queryString = Uri(queryParameters: queryParams).query;
    var uri = '${AppConstants.BASE_URL + AppConstants.GET_DIAL_CODE}';
    print('code api ur  $uri');
    var response = await http.get(
      Uri.parse('${AppConstants.BASE_URL + AppConstants.GET_DIAL_CODE}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    print('get dialcode response  ${response.body}');
    if (response.statusCode == 200) {
      Countrycode data = Countrycode.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('Server Error');
    }
  }

//=======================================================================================================
  Future<CountryListModel> getCitylist({required String countryId}) async {
    String token = await getToken_byReresh();
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      'country_id': countryId,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.GET_CITY_LIST + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      CountryListModel data =
          CountryListModel.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('Server Error');
    }
  }

//===============================================================================================================

  Future<Activities> getActivities() async {
    String token = await getToken_byReresh();
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var response = await http.get(
      Uri.parse('${AppConstants.BASE_URL + AppConstants.GET_ACTIVITIES}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    print('activity data :  ${response.body}');
    if (response.statusCode == 200) {
      Activities data = Activities.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Server Error');
    }
  }

  //==================================================================================================================
  Future<CalenderEventResponseModel> post_Calender_Event(
      eventPost jsonModel) async {
    //encode Map to JSON
    String token = await getToken_byReresh();
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var body = json.encode(jsonModel.toJson());
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.POST_CALENDER_EVENT),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: body);
    CalenderEventResponseModel calenderEventResponseModel =
        CalenderEventResponseModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return calenderEventResponseModel;
  }

//====================================================================================================================
  Future<CalenderEventResponseModel> get_Calender_Event(
      {required String empCode}) async {
    Map<String, String> queryParams = {"emp_code": empCode};
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL +
          AppConstants.POST_CALENDER_EVENT +
          "?" +
          queryString),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',
      },
    );
    CalenderEventResponseModel calenderEventResponseModel =
        CalenderEventResponseModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return calenderEventResponseModel;
  }

  //==================================================================================================================
  Future<CalenderEventResponseModel> update_Calendar_Event(
      eventPost jsonModel, int id) async {
    //encode Map to JSON
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var body = json.encode(jsonModel.toJson());
    String token = await getToken_byReresh();
    var response = await http.patch(
        Uri.parse(AppConstants.BASE_URL +
            AppConstants.UPDATE_CALENDER_EVENT +
            id.toString() +
            "/"),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: body);
    CalenderEventResponseModel calenderEventResponseModel =
        CalenderEventResponseModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return calenderEventResponseModel;
  }

  //======================================================================================================================

  Future<PassportModel> get_employee_passport({required String empCode}) async {
    Map<String, String> queryParams = {"employee": empCode};
    String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    String token = await getToken_byReresh();
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL +
          AppConstants.GET_EMPLOYEE_PASSPORT +
          "?" +
          queryString),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    PassportModel passportModel =
        PassportModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return passportModel;
  }

  Future<Passportfor> get_employee_passportfor(
      {required String empCode}) async {
    Map<String, String> queryParams = {"employee": empCode};
    String queryString = Uri(queryParameters: queryParams).query;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL +
          AppConstants.GET_EMPLOYEE_PASSPORTFOR +
          "?" +
          queryString),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    print('new relation list ${response.body}');
    Passportfor passportModel = Passportfor.fromJson(jsonDecode(response.body));
    // print("${passportModel}");
    //  print('new passportModelpassportModel list ${passportModel.}');
    // print("${response.body}");
    return passportModel;
  }

  Future<PassportModel> post_employee_passport({data}) async {
    // post_employee_passport({data}) async {
    // Map<String, String> queryParams = {"employee": empCode};
    // String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    print('add passport data--------- ${data}');
    String token = await getToken_byReresh();
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.POST_EMPLOYEE_PASSPORT),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
        // body: jsonEncode([
        //   {
        //     "passport_status": true,
        //     "passport_number": "884042",
        //     "passport_expiry_date": "",
        //     "nationality": "India",
        //     "country_of_issue": "India",
        //     "place_of_issue": "New Delhi",
        //     "date_of_issue": "2020-08-21T18:30:00.000Z",
        //     "date_of_expiration": "2024-08-22T18:30:00.000Z",
        //     "duplicate_passport": false,
        //     "pages_passport": "5",
        //     "isdependent": false,
        //     "photo": "/media/favion-32.png",
        //     "relation": "Self",
        //     "emp_code": "div944",
        //     "update_id": ""
        //   }
        // ]));
        body: jsonEncode(data));
    print('add passport value ${response.body}');
    // return;
    PassportModel passportModel =
        PassportModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return passportModel;
  }

  Future<PassportModel> post_employee_visa({data}) async {
    // Map<String, String> queryParams = {"employee": empCode};
    // String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    // print('add passport data--------- ${data}');
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    String token = await getToken_byReresh();
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.POST_EMPLOYEE_VISA),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(data));
    // print('add passport value ${response.body}');
    PassportModel passportModel =
        PassportModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return passportModel;
  }

  //========================================================================================================================
  Future<VisaModel> get_employee_visa({required String empCode}) async {
    Map<String, String> queryParams = {"employee": empCode};
    String queryString = Uri(queryParameters: queryParams).query;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL +
          AppConstants.GET_EMPLOYEE_VISA +
          "?" +
          queryString),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    VisaModel visaModel = VisaModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("visa response ${response.body}");
    return visaModel;
  }

  //=================================================================================================================
  Future<NotificationModel> get_notifcations() async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      "email": userInfo.data.empCode,
      "org_id": userInfo.data.orgId
    };
    String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL +
          AppConstants.GET_EMPLOYEE_NOTIFICATIONS +
          "?" +
          queryString),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    NotificationModel notificationModel; //= NotificationModel();
    if (response.statusCode == 200) {
      notificationModel = NotificationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Error();
    }

    return notificationModel;
  }

//=============================================================================================
  Future<bool> delete_notification({notiId}) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map data = {"email": userInfo.data.empCode, "id": notiId};
    //encode Map to JSON
    var body = json.encode(data);

    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.post(
      Uri.parse(
          AppConstants.BASE_URL + AppConstants.GET_EMPLOYEE_NOTIFICATIONS),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: body,
    );

    if (response.statusCode == 201) {
      print("true");
      return true;
    } else {
      print("false");
      return false;
    }
  }

  //===========================================================================================
  Future<UserProfileModel> get_user_profile() async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {"employee": userInfo.data.empCode};
    String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL +
          AppConstants.GET_EMPLOYEE_PROFILE +
          "?" +
          queryString),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    // print('getuser profile ${response.body}');
    UserProfileModel userProfileModel; //= UserProfileModel();
    if (response.statusCode == 200) {
      userProfileModel = UserProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Error();
    }

    return userProfileModel;
  }

  //=======================================================================================

  Future<UserInfo> update_UserProfile(UserProfile jsonModel) async {
    //encode Map to JSON
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    String token = await getToken_byReresh();
    print('date created update profile response ${jsonModel.dateCreated}');
    var body = json.encode(jsonModel.toJson());
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.UPDATE_EMPLOYEE_PROFILE),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
          'Accept': 'application/json',
        },
        body: body);
    print('update profile response ${response.body}');
    UserInfo updatedModel;
    if (response.statusCode != 500) {
      updatedModel = UserInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
    return updatedModel;
  }

  Future<UserInfo> update_Profile(UserInfoPayload jsonModel) async {
    //encode Map to JSON
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    String token = await getToken_byReresh();
    print('data of update profile ${jsonModel.userName}');
    var body = json.encode(jsonModel.toJson());
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.UPDATE_EMPLOYEE_PROFILE),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
          'Accept': 'application/json',
        },
        body: body);
    print('data of update profile response ${response.body}');
    UserInfo updatedModel;
    if (response.statusCode != 500) {
      updatedModel = UserInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
    return updatedModel;
  }

  //====================================================================================

  Future<DocumentModelClass> get_doc_vault(String type) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {
      "emp_code": userInfo.data.empCode,
      'vault_type': type
    };
    String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL +
          AppConstants.POST_VAULT_DOCUMENT +
          "?" +
          queryString),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    DocumentModelClass documentModelClass; //= DocumentModelClass();
    if (response.statusCode == 200) {
      documentModelClass =
          DocumentModelClass.fromJson(jsonDecode(response.body));
    } else {
      throw Error();
    }

    return documentModelClass;
  }

//==========================================================================================================

  Future<EmergencyModel> getEmergencyContact() async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    String empMail = userInfo.data.empCode;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {'employee': empMail};
    String queryString = Uri(queryParameters: queryParams).query;

    //   String token = await _TokenGetter.getAcessToken() ?? "";
    String token = await getToken_byReresh();
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL +
          AppConstants.GET_EMERGENCY_CONTACT +
          "?" +
          queryString),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    EmergencyModel emergencyModel =
        EmergencyModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return emergencyModel;
  }

  Future<NewEmergency> get2EmergencyContact() async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    String empMail = userInfo.data.empCode;
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {'employee': empMail};
    String queryString = Uri(queryParameters: queryParams).query;

    //   String token = await _TokenGetter.getAcessToken() ?? "";
    String token = await getToken_byReresh();
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL +
          AppConstants.GET_EMERGENCY_CONTACT +
          "?" +
          queryString),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    NewEmergency emergencyModel =
        NewEmergency.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return emergencyModel;
  }

  Future<NewEmergency> postEmergencyContact(jsonmodel) async {
    String token = await getToken_byReresh();
    var body = json.encode(jsonmodel);
    print('post emergency $body');
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.POST_EMERGENCY_CONTACT),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
        body: body);
    print("add emergency response ${response.body}");
    NewEmergency emergencyModel =
        NewEmergency.fromJson(jsonDecode(response.body));
    // print("${response.statusCode}");
    // print("add emergency response ${response.body}");
    return emergencyModel;
  }

  //=========================================================================================================

  Future<PasswordResponse> ChangePass(ChangePassPayload jsonModel) async {
    //encode Map to JSON
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    String token = await getToken_byReresh();
    var body = json.encode(jsonModel.toJson());
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.CHANGE_PASS),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: body);

    if (response.statusCode == 200) {
      return PasswordResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('API Error');
    }
  }

  //==============================================================================================================

  Future<RelationList> getRelationList() async {
    String token = await getToken_byReresh();
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var response = await http.get(
      Uri.parse('${AppConstants.BASE_URL + AppConstants.RELATION_LIST}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    // print('relation data ${response.body}');
    if (response.statusCode == 200) {
      RelationList data = RelationList.fromJson(jsonDecode(response.body));
      await _TokenGetter.saveRelationList(data);
      return data;
    } else {
      throw Exception('api error');
    }
  }

  //==================================================================================================================

  Future<SubmitResponseQuestions> submitComplianceQuestions(
      List<ComplianceQuestion> jsonModel) async {
    String token = await getToken_byReresh();
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var json = jsonEncode(jsonModel.map((e) => e.toJson()).toList());
    // print('online compliance data ${json}');
    var response = await http.post(
        Uri.parse(
            '${AppConstants.BASE_URL + AppConstants.COMPLIANCE_QUESTIONS}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
        body: json);

    if (response.statusCode == 200) {
      return SubmitResponseQuestions.fromJson(jsonDecode(response.body));
      ;
    } else {
      throw Exception('Api Error');
    }
  }

  //====================================================================================================================

  Future<ComplianceModel> checktheQuestions(String empcode) async {
    String token = await getToken_byReresh();
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    Map<String, String> queryParams = {'emp_code': empcode};
    String queryString = Uri(queryParameters: queryParams).query;
    var response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.COMPLIANCE_QUESTIONS + "?" + queryString}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      ComplianceModel data =
          ComplianceModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('api error');
    }
  }

  //==========================================================================================================================
  Future<bool> submitBulkApproval(List<BulkApprovalJson> jsonModel) async {
    String token = await getToken_byReresh();
    var json = jsonEncode(jsonModel.map((e) => e.toJson()).toList());

    var response = await http.post(
        Uri.parse('${AppConstants.BASE_URL + AppConstants.BULK_APPROVAL}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
        body: json);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
//===================================================================================================================================
}
