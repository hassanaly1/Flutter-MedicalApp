import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/screens/patient/auth/login_screen.dart';
import 'package:medical_app/screens/patient/auth/signup_screen.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 36.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                'assets/images/applogo.svg',
              ),
            ),
            SizedBox(height: Get.height * 0.2),
            const CustomTextWidget(
              text: "Let's get started!",
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 15),
            const CustomTextWidget(
              text: "NO ONE IS DISQUALIFIED!",
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              textColor: Colors.grey,
            ),
            const CustomTextWidget(
              text: "We need a strong/Motivational message here",
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              textColor: Colors.grey,
            ),
            const SizedBox(height: 15),
            CustomButton(
              buttonText: 'Login',
              onTap: () {
                Get.to(const LoginScreen(), transition: Transition.downToUp);
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              buttonText: 'Sign Up',
              buttonColor: Colors.transparent,
              textColor: AppColors.primaryColor,
              onTap: () {
                Get.to(const SignUpScreen(), transition: Transition.downToUp);
              },
            )
          ],
        ),
      ),
    );
  }
}
