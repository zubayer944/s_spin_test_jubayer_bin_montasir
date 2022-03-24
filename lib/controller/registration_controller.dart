import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/registration_repo.dart';
import '../view/otp_verification/otp_verification_view.dart';

class RegistrationController extends GetxController {



  RxBool isRegistrationLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void sendOtpController(
      {required Map<String,dynamic>registrationDataMap}) async {
    try {
      RegistrationRepo()
          .registrationPost(registrationData: registrationDataMap)
          .then((bool value) {
        if (value == true) {
          isRegistrationLoading.value = true;
          Get.rawSnackbar(
            title: 'Success',
            message: 'Registration has been successfully',
            backgroundColor: Colors.green,
          );

        } else {
          Get.rawSnackbar(
            title: 'Error',
            message: 'Registration failed',
            backgroundColor: Colors.red,
          );
        }
      });
    } catch (e) {
      print(
          'RegistrationController.profileUpdateController controller error : ' +
              e.toString());
    }
  }
}
