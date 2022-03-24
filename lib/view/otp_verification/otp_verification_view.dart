import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/otp_verification_controller.dart';
import '../common_widgets/colors.dart';
import '../common_widgets/custom_elevated_button.dart';
import '../common_widgets/custom_font_style.dart';
import '../common_widgets/text_from_field.dart';
import '../login_view/login_view.dart';

class OtpVerification extends StatelessWidget {
  Map<String, dynamic> registrationMap;
  OtpVerification({required this.registrationMap, Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final OtpVerificationController _controller =
      Get.put(OtpVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 45,
                ),
                Image.asset("assets/images/solution_logo_n.png"),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Otp Verification : ",
                  style: CustomFontStyle.notoSans(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFromField().textFromField(
                  onTap: () {},
                  onChanged: (value) {
                    registrationMap.addAll({"otpNumberForPhone": value});
                  },
                  hintTile: "Enter OTP Code",
                  titleText: "Phone OTP",
                  mandatorySign: "*",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return value!.isEmpty ? "Phone OTP is required" : null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFromField().textFromField(
                  onChanged: (value) {
                    registrationMap.addAll({"otpNumberForEmail": value});
                  },
                  onTap: () {},
                  hintTile: "Enter OTP Code",
                  titleText: "Email OTP",
                  mandatorySign: "*",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return value!.isEmpty ? "Email OTP is required" : null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(() => _controller.isVerifying.value == false
                    ? Center(
                        child: CustomElevatedButton.customElevatedButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _controller.otpVerificationController(
                                  registrationDataMap: registrationMap);
                              Get.to(LogInView());
                            }
                          },
                          btnName: "Next",
                          fontColors: backgroundColor,
                          width: 120,
                          height: 45,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          backgroundColor: logInBtnColor,
                        ),
                      )
                    : SizedBox()),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
