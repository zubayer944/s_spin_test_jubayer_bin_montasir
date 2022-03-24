import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45.h,
                ),
                Image.asset("assets/images/solution_logo_n.png"),
                SizedBox(
                  height: 25.h,
                ),
                _allTextFields(),
                SizedBox(
                  height: 45.h,
                ),
                _nextBtn(),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _allTextFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Otp Verification : ",
          style: CustomFontStyle.notoSans(
              fontWeight: FontWeight.w600, fontSize: 20.h),
        ),
        SizedBox(
          height: 30.h,
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
        SizedBox(
          height: 15.h,
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
      ],
    );
  }

  Widget _nextBtn() {
    return Center(
      child: CustomElevatedButton.customElevatedButton(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            _controller.otpVerificationController(
                registrationDataMap: registrationMap);
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
    );
  }
}
