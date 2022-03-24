import 'dart:convert';

import '../helper/app_url.dart';

import 'package:http/http.dart' as http;

class LoginRepo {
  var headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };
  Future<bool> loginRepoPost({required Map<String, dynamic> logInData}) async {
    try {
      Uri url = Uri.parse(AppUrl.logINUrl);
      print('LoginRepo.loginRepoPost url : ' + AppUrl.logINUrl.toString());

      final http.Response response =
          await http.post(url, body: jsonEncode(logInData), headers: headers);
      print('LoginRepo.loginRepoPost outer map : ' + logInData.toString());

      if (response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 200) {
        print('LoginRepo.loginRepoPost inner status : ' +
            response.statusCode.toString());
        return true;
      } else {
        print('LoginRepo.loginRepoPost repo status : ' +
            response.statusCode.toString());
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
