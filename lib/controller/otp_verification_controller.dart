import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repository/otp_verification_repo.dart';

class OtpVerificationController extends GetxController {
  RxBool isVerifying = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void otpVerificationController(
      {required Map<String, dynamic> registrationDataMap}) async {
    try {
      OtpVerificationRepo()
          .otpVerificationPostRepo(registrationData: registrationDataMap)
          .then((bool value) {
        if (value == true) {
          isVerifying.value = true;
          Get.rawSnackbar(
            title: 'Success',
            message: 'Verification has been successfully',
            backgroundColor: Colors.green,
          );
          // Get.to(OtpVerification());
        } else {
          Get.rawSnackbar(
            title: 'Error',
            message: 'Verification failed',
            backgroundColor: Colors.red,
          );
        }
      });
    } catch (e) {
      print('OtpVerificationController.sendOtpController controller error : ' +
          e.toString());
    }
  }
}
