import 'dart:convert';

import 'package:http/http.dart';
import 'package:task_dummy_api/model/post_model.dart';

class Network {

  static String BASE = 'dummy.restapiexample.com';

  /* HTTP APIs */
  //****************************************************************************
  static String API_LIST = '/api/v1/employees';
  static String API_GET = '/api/v1/employee/'; // {id}
  static String API_CREATE = '/api/v1/create';
  static String API_UPDATE = '/api/v1/update/'; // {id}
  static String API_DELETE = '/api/v1/delete/'; // {id}
  //****************************************************************************


  /* HTTP Request */
  //****************************************************************************
  static Future<String> LIST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri);
    if(response.statusCode == 200) return response.body;
    return null;
  }

  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri);
    if(response.statusCode == 200) return response.body;
    return null;
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api);
    var response = await put(uri, body: jsonEncode(params));
    if(response.statusCode == 200) return response.body;
    print(response.statusCode);
    return null;
  }
  //****************************************************************************


  /* HTTP params */
  //****************************************************************************
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      'name' : post.name,
      'salary' : post.salary,
      'age' : post.age,
    });
    return params;
  }
  //****************************************************************************

}