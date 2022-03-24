import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repository/registration_repo.dart';
import '../view/common_widgets/colors.dart';
import '../view/otp_verification/otp_verification_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegistrationController extends GetxController {
  RxBool isRegistrationLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void sendOtpController(
      {required Map<String, dynamic> registrationDataMap}) async {
    try {
      Get.dialog(
        const SpinKitThreeBounce(
          color: blueBtnBackgroundColor,
          size: 40,
        ),
      );
      RegistrationRepo()
          .registrationPost(registrationData: registrationDataMap)
          .then((bool value) {
        Get.back();
        if (value == true) {
          Get.rawSnackbar(
            title: 'Success',
            message: 'Registration has been successfully',
            backgroundColor: Colors.green,
          );
          Get.offAll(OtpVerification(registrationMap: registrationDataMap));
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
