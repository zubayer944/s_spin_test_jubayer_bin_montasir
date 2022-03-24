import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/registration_controller.dart';
import '../common_widgets/colors.dart';
import '../common_widgets/custom_elevated_button.dart';
import '../common_widgets/custom_font_style.dart';
import '../common_widgets/text_from_field.dart';
import '../login_view/login_view.dart';
import '../otp_verification/otp_verification_view.dart';

class RegistrationView extends StatelessWidget {
  RegistrationView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final RegistrationController _controller = Get.put(RegistrationController());

  static Map<String, dynamic> registrationDataMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w),
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
                Text(
                  "Registration : ",
                  style: CustomFontStyle.notoSans(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  height: 15.h,
                ),
                _allTextBoxes(),
                SizedBox(
                  height: 15.h,
                ),
                _nextBtn(),
                SizedBox(
                  height: 15.h,
                ),
                _signInBtn(),
                SizedBox(
                  height: 15.h,
                ),
              ],
            )),
      ),
    ));
  }

  Widget _allTextBoxes() {
    return Column(
      children: [
        CustomTextFromField().textFromField(
          controller: TextEditingController(),
          onTap: () {},
          onChanged: (value) {
            registrationDataMap.addAll({"name": value});
          },
          hintTile: "Enter User Name",
          titleText: "User Name",
          mandatorySign: "*",
          keyboardType: TextInputType.text,
          validator: (value) {
            return value!.isEmpty ? "User Name is required" : null;
          },
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomTextFromField().textFromField(
          onTap: () {},
          onChanged: (value) {
            registrationDataMap.addAll({"email": value});
          },
          hintTile: "Enter Email",
          titleText: "Email",
          mandatorySign: "*",
          keyboardType: TextInputType.emailAddress,
          validator: (String? value) {
            if (value == "") {
              return "Email is required";
            } else if (!GetUtils.isEmail(value!)) {
              return 'Please enter a valid email';
            } else {
              return null;
            }
          },
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomTextFromField().textFromField(
          onTap: () {},
          onChanged: (value) {
            registrationDataMap.addAll({"password": value});
          },
          hintTile: "Enter Password",
          titleText: "Password",
          mandatorySign: "*",
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return "Password is required";
            } else if (!value.contains(RegExp(r"[a-z]")) &&
                !value.contains(RegExp(r"[A-Z]"))) {
              return "At least 1 character need";
            } else if (!value.contains(RegExp("[0-9]"))) {
              return "At least 1 digit need";
            } else if (value.length >= 8) {
              return null;
            } else {
              return "Password must contain minimum 8 characters!";
            }
            // return value!.isEmpty ? "Password is required" : null;
          },
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomTextFromField().textFromField(
          onTap: () {},
          onChanged: (value) {
            // registrationDataMap.addAll({"password": value});
          },
          hintTile: "Enter Confirm Password",
          titleText: "Confirm Password",
          mandatorySign: "*",
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return "Confirm Password is required";
            } else if (value == registrationDataMap["password"]) {
              registrationDataMap.addAll({"password": value});
              return null;
            } else {
              return "Password does't match";
            }
          },
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomTextFromField().textFromField(
          onChanged: (value) {
            registrationDataMap.addAll({"phoneNumber": value});
          },
          onTap: () {},
          hintTile: "Enter Phone Number",
          titleText: "Phone Number",
          mandatorySign: "",
          keyboardType: TextInputType.phone,
          validator: (value) {
            return value!.isEmpty ? "Phone Number is required" : null;
          },
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomTextFromField().textFromField(
          onChanged: (String value) {
            registrationDataMap.addAll({"countryCode": "BD"});
          },
          onTap: () {},
          hintTile: "Enter Country Code",
          titleText: "Country Code",
          mandatorySign: "*",
          keyboardType: TextInputType.phone,
          validator: (value) {
            return value!.isEmpty ? "Country Code is required" : null;
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
            _controller.sendOtpController(
                registrationDataMap: registrationDataMap);
          }
        },
        btnName: "Next",
        fontColors: backgroundColor,
        width: 120.w,
        height: 45.h,
        fontSize: 18.h,
        fontWeight: FontWeight.w700,
        backgroundColor: logInBtnColor,
      ),
    );
  }

  Widget _signInBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Does Have An Account? ",
          style: CustomFontStyle.notoSans(fontSize: 18),
        ),
        InkWell(
          onTap: () {
            Get.to(LogInView());
          },
          child: Text(
            "Sign in now",
            style: CustomFontStyle.notoSans(
                textDecoration: TextDecoration.underline,
                color: logInBtnColor,
                fontSize: 18.h),
          ),
        )
      ],
    );
  }
}
