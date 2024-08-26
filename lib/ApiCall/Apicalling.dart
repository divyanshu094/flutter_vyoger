// ignore_for_file: file_names

import "dart:convert";
import 'package:http/http.dart' as http;
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

class ApiCall {
///////////////get api call//////////////
  getapical(ext) async {
    String token = await ApiProvider().getToken_byReresh();

    final response = await http
        .get(Uri.parse(AppConstants.BASE_URL + ext), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}',
    });
    var res = await jsonDecode(response.body);
    return res;
  }

///////////////// post api call ///////////////////
  postapical(data, ext) async {
    final response = await http.post(
      Uri.parse(AppConstants.BASE_URL + ext),
      body: (data),
    );
    var res = await jsonDecode(response.body);
    return res;
  }

/////////////////// post api with array , need json to encode   /////////////////////////
  profilepostapical(data, ext) async {
    String token = await ApiProvider().getToken_byReresh();
    final response = await http.post(
      Uri.parse(AppConstants.BASE_URL + ext),
      // headers: headers,
      body: jsonEncode(data), //jsonEncode(jsonDecode(data)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    // print('profile response ${response.body}');
    var res = await jsonDecode(response.body);
    return res;
  }

///////////// post api with token //////////////
  pass_profilepostapical(data, ext) async {
    String token = await ApiProvider().getToken_byReresh();
    final response = await http.post(Uri.parse(AppConstants.BASE_URL + ext),
        // headers: headers,
        body: data, //jsonEncode(jsonDecode(data)),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}',
        });
    // print('profile response ${response.body}');
    var res = await jsonDecode(response.body);
    return res;
  }
}
