
import 'package:bloc_demo_project/common/dialogs/common_dialogs.dart';
import 'package:bloc_demo_project/common/network/network_check.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


// This class contains network connectivity methods such as get, post delete etc.
class ApiHitter {
  final dio = Dio();
  static final ApiHitter shared = ApiHitter._internal();
  var networkCheck = NetworkCheck();

  factory ApiHitter() {
    return shared;
  }

  ApiHitter._internal();

  getApi(
      {required String endPoint,}) async {
    try {
      if (await networkCheck.hasNetwork()) {

        print("GET URL : ${endPoint}");

        var response =
        await dio.get(endPoint);

        print("RESPONSE ($endPoint) >>>>>>> ${response.data}");

        return response;
      } else {
          // noInternetConnectionDialog(context: context);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  noInternetConnectionDialog({required BuildContext context}) {
    showCommonAlertSingleButtonDialog(
        title: "No Internet Connection",
        subHeader:"Please check your internet connectivity",
        okPressed: () {
          Navigator.of(context).pop();
        });
  }

}
