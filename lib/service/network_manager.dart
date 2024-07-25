import 'dart:async';
import 'dart:convert';
import 'package:anjita_demo/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

import '../models/reponse_model.dart';

class NetworkManager {
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true; // There is an active internet connection
    } else {
      return false; // There is no active internet connection
    }
  }

  Future<ResponseData<dynamic>> getApi1(String endPoint,
      {bool? isKeyApi}) async {
    if (await checkInternetConnection()) {
      try {
        var url = Uri.parse(endPoint);
        var response = await http
            .get(url, headers: normalResponseHeader1())
            .timeout(const Duration(seconds: 15));
        if (response.statusCode == 200) {
          Map json = jsonDecode(response.body);
          if (json.isNotEmpty && json.containsKey('data')) {
            return ResponseData<List>(
                object: json['data'], status: Constant.TRUE);
          } else {
            ResponseData<String> res = ResponseData(
                object: "Some thing went wrong while Converting json data..",
                status: Constant.FALSE);
            return res;
          }
        } else {
          ResponseData<String> response = ResponseData(
              object: "Some thing went wrong while trying to fetch data.",
              status: Constant.FALSE);
          return response;
        }
      } on Exception catch (ex) {
        ResponseData<String> response = ResponseData(
            object: ex.runtimeType == TimeoutException
                ? "Server Time-out."
                : "Some thing went wrong while trying to fetch data..",
            status: Constant.FALSE);
        return response;
      }
    } else {
      ResponseData<String> response = ResponseData(
          object: "Check your internet connection", status: Constant.FALSE);
      return response; //Return type string
    }
  }

  timeoutFunction(String path) {
    ResponseData<String> response = ResponseData(
        object: "Some thing went wrong while trying to fetch data",
        status: Constant.FALSE);
    return response;
  }

  Future<ResponseData<dynamic>> postApi1(String endPoint,
      {var requestBody}) async {
    if (await checkInternetConnection()) {
      try {
        var url = Uri.parse(endPoint);
        var response = await http
            .post(url,
                body: jsonEncode(requestBody), headers: normalResponseHeader1())
            .timeout(const Duration(seconds: 60));
        if (response.statusCode == 201) {
          Map<String, dynamic> json = jsonDecode(response.body);
          if (json.isNotEmpty) {
            return ResponseData<Map<String, dynamic>>(
                object: json, status: Constant.TRUE);
          } else {
            ResponseData<String> res = ResponseData(
                object: "Some thing went wrong while Converting json data..",
                status: Constant.FALSE);
            return res;
          }
        } else if (response.statusCode == 422) {
          List json = jsonDecode(response.body);
          String msg = "Some thing went wrong while trying to upload data.";
          if (json.isNotEmpty) {
            Map<String, dynamic> map = json[0];
            if (map.containsKey('message')) {
              msg = map['field'] + " " + map['message'];
            }
          }
          ResponseData<String> res =
              ResponseData(object: msg, status: Constant.FALSE);
          return res;
        } else {
          ResponseData<String> res = ResponseData(
              object: "Some thing went wrong while trying to upload data.",
              status: Constant.FALSE);
          return res;
        }
      } on Exception catch (ex) {
        ResponseData<String> response = ResponseData(
            object: ex.runtimeType == TimeoutException
                ? "Server Time-out."
                : "Some thing went wrong while trying to fetch data.",
            status: Constant.FALSE);
        return response;
      }
    } else {
      ResponseData<String> response = ResponseData(
          object: "Check your internet connection", status: Constant.FALSE);
      return response; //Return type string
    }
  }

  Map<String, String> normalResponseHeader1() {
    return {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization":
          "Bearer 138b2f3379b1b2c74e2cee807ce5fb813bedba27a5163d5d69a726448f8e3130"
    };
  }
}
