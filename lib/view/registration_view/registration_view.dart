import 'package:flutter/material.dart';
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
                  "Registration : ",
                  style: CustomFontStyle.notoSans(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
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
                const SizedBox(
                  height: 15,
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
                  validator: (value) {
                    return value!.isEmpty ? "Email is required" : null;
                  },
                ),
                const SizedBox(
                  height: 15,
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
                    } else if (value.length >= 8) {
                      return null;
                    } else {
                      return "Password must contain minimum 8 characters!";
                    }
                    // return value!.isEmpty ? "Password is required" : null;
                  },
                ),
                const SizedBox(
                  height: 15,
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
                const SizedBox(
                  height: 15,
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
                const SizedBox(
                  height: 15,
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
                const SizedBox(
                  height: 15,
                ),
                Obx(() => _controller.isRegistrationLoading.value == false
                    ? Center(
                        child: CustomElevatedButton.customElevatedButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _controller.sendOtpController(
                                  registrationDataMap: registrationDataMap);
                              if (_controller.isRegistrationLoading.value ==
                                  true) {
                                Get.to(OtpVerification(
                                    registrationMap: registrationDataMap));
                              }
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
                    : const SizedBox()),
                const SizedBox(
                  height: 15,
                ),
                Row(
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
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            )),
      ),
    ));
  }
}
