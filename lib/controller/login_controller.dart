import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/login_repo.dart';
import '../view/welcome_view/welcome_view.dart';

class LogInController extends GetxController {
  RxBool isLoggedIn = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void logINController({required Map<String, dynamic> logInDataMap}) async {
    try {
      LoginRepo().loginRepoPost(logInData: logInDataMap).then((bool value) {
        if (value == true) {
          isLoggedIn.value = true;
          Get.rawSnackbar(
            title: 'Success',
            message: 'Login has been successfully',
            backgroundColor: Colors.green,
          );
          Get.to(const WelcomeView());
          // Get.to(OtpVerification());
        } else {
          Get.rawSnackbar(
            title: 'Login failed!',
            message: 'Invalid Email or password',
            backgroundColor: Colors.red,
          );
        }
      });
    } catch (e) {
      print(
          'LogInController.logINController controller error : ' + e.toString());
    }
  }
}
