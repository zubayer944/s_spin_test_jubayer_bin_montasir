import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/login_controller.dart';
import '../common_widgets/colors.dart';
import '../common_widgets/custom_elevated_button.dart';
import '../common_widgets/custom_font_style.dart';
import '../common_widgets/text_from_field.dart';
import '../registration_view/registration_view.dart';

class LogInView extends StatelessWidget {
  LogInView({Key? key}) : super(key: key);

  final LogInController _logInController = Get.put(LogInController());
  final _formKey = GlobalKey<FormState>();
  static Map<String, dynamic> loginDataMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset("assets/images/solution_logo_n.png"),
                const SizedBox(
                  height: 25,
                ),
                Center(
                    child: Text(
                  "Continue with email or phone number",
                  style: CustomFontStyle.notoSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                )),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFromField().textFromField(
                  onTap: () {},
                  onChanged: (value) {
                    loginDataMap.addAll({"email": value});
                  },
                  hintTile: "Email or Phone",
                  titleText: "Email or Phone",
                  mandatorySign: "*",
                  validator: (value) {
                    return value!.isEmpty ? "Phone or email is required" : null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFromField().textFromField(
                  onChanged: (value) {
                    loginDataMap.addAll({"password": value});
                  },
                  onTap: () {},
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
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Obx(() => _logInController.isLoggedIn.value == false
                    ? CustomElevatedButton.customElevatedButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _logInController.logINController(
                                logInDataMap: loginDataMap);
                          }
                        },
                        btnName: "LogIn",
                        fontColors: backgroundColor,
                        width: 120,
                        height: 45,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        backgroundColor: logInBtnColor,
                      )
                    : const SizedBox()),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(RegistrationView());
                  },
                  child: Text("Create A New Account",
                      style: CustomFontStyle.notoSans(
                          color: logInBtnColor,
                          fontSize: 16,
                          textDecoration: TextDecoration.underline)),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Text("Forgotten password",
                      style: CustomFontStyle.notoSans(
                          color: logInBtnColor,
                          fontSize: 16,
                          textDecoration: TextDecoration.underline)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
