import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/colors.dart';
import '../common_widgets/custom_elevated_button.dart';
import '../common_widgets/custom_font_style.dart';
import '../login_view/login_view.dart';

import '../registration_view/registration_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            welcomeTxt(),
            const SizedBox(
              height: 24,
            ),
            Image.asset("assets/images/solution_logo_n.png"),
            const SizedBox(
              height: 49,
            ),
            loginAndSignUpBtn(),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Or via social media",
              textAlign: TextAlign.center,
              style: CustomFontStyle.notoSans(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            socialMediaBtn(),
            const SizedBox(
              height: 75,
            )
          ],
        ),
      ),
    );
  }

  Widget welcomeTxt() {
    return Center(
      child: Text(
        "Welcome",
        style: CustomFontStyle.notoSans(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget loginAndSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomElevatedButton.customElevatedButton(
          height: 48,
          width: 140,
          fontColors: backgroundColor,
          onTap: () {
            Get.to(LogInView());
          },
          btnName: "LogIn",
          fontSize: 18,
          backgroundColor: blueBtnBackgroundColor,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          width: 16,
        ),
        CustomElevatedButton.customElevatedButton(
          height: 48,
          width: 140,
          backgroundColor: yellowBtnBackgroundColor,
          fontColors: backgroundColor,
          onTap: () {
            Get.to(RegistrationView());
          },
          btnName: "SignUp",
          fontSize: 18,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }

  Widget socialMediaBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.transparent)),
            child: Center(
              child: Image.asset(
                "assets/icons/facebook.png",
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.transparent)),
            child: Center(
              child: Image.asset(
                "assets/icons/google.png",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
