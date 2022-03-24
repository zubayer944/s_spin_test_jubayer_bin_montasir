import 'dart:convert';
import '../helper/app_url.dart';
import 'package:http/http.dart' as http;

class RegistrationRepo {
  var headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };
  Future<bool> registrationPost(
      {required Map<String,dynamic> registrationData}) async {
    try {
      Uri url = Uri.parse(AppUrl.otpSendUrl);
      print('RegistrationRepo.registrationPost url : ' +
          AppUrl.otpSendUrl.toString());

      final http.Response response = await http.post(url,
          body: jsonEncode(registrationData), headers: headers);
      print('RegistrationRepo.registrationPost outer map : ' +
          registrationData.toString());

      if (response.statusCode == 201 || response.statusCode == 202) {
        print('RegistrationRepo.registrationPost inner status : ' +
            response.statusCode.toString());
        return true;
      } else {
        print('RegistrationRepo.registrationPost repo status : ' +
            response.statusCode.toString());
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
