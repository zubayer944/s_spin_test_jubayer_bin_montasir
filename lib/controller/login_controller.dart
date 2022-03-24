import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../repository/login_repo.dart';
import '../view/common_widgets/colors.dart';
import '../view/welcome_view/welcome_view.dart';

class LogInController extends GetxController {
  RxBool isLoggedIn = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void logINController({required Map<String, dynamic> logInDataMap}) async {
    try {
      Get.dialog(
        const SpinKitThreeBounce(
          color: blueBtnBackgroundColor,
          size: 40,
        ),
      );

      LoginRepo().loginRepoPost(logInData: logInDataMap).then((bool value) {
        if (value == true) {
          Get.rawSnackbar(
            title: 'Success',
            message: 'Login has been successfully',
            backgroundColor: Colors.green,
          );
          Get.to(const WelcomeView());
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
