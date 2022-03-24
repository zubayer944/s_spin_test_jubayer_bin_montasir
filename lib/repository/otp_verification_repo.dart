import 'dart:convert';
import '../helper/app_url.dart';
import 'package:http/http.dart' as http;

class OtpVerificationRepo {
  var headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };
  Future<bool> otpVerificationPostRepo(
      {required Map<String, dynamic> registrationData}) async {
    try {
      Uri url = Uri.parse(AppUrl.registrationUrl);
      print('OtpVerificationRepo.otpVerificationPostRepo url : ' +
          url.toString());

      final http.Response response = await http.post(url,
          body: jsonEncode(registrationData), headers: headers);
      print('OtpVerificationRepo.otpVerificationPostRepo outer map : ' +
          registrationData.toString());

      if (response.statusCode == 201 || response.statusCode == 202) {
        print('OtpVerificationRepo.otpVerificationPostRepo inner status : ' +
            response.statusCode.toString());
        return true;
      } else {
        print('OtpVerificationRepo.otpVerificationPostRepo status : ' +
            response.statusCode.toString());
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
