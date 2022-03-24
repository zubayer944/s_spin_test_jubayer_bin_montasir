import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../repository/otp_verification_repo.dart';
import '../view/common_widgets/colors.dart';
import '../view/login_view/login_view.dart';

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
      Get.dialog(
         const SpinKitThreeBounce(
          color: blueBtnBackgroundColor,
          size: 40,
        ),
      );
      OtpVerificationRepo()
          .otpVerificationPostRepo(registrationData: registrationDataMap)
          .then((bool value) {
        if (value == true) {

          Get.rawSnackbar(
            title: 'Success',
            message: 'Verification has been successfully',
            backgroundColor: Colors.green,
          );
          Get.to(LogInView());

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
