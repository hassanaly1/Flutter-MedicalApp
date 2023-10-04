import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/screens/doctor/auth/auth/account_created.dart';
import 'package:medical_app/screens/doctor/auth/auth/doctor_login_screen.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';
import 'package:medical_app/widgets/custom_textfield.dart';

class DoctorSignupScreen extends StatelessWidget {
  const DoctorSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DoctorCustomTextWidget(
                text: 'Sign Up',
                fontSize: 35,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                textColor: AppColors.primaryColor,
              ),
              SizedBox(height: Get.height * 0.02),
              const DoctorCustomTextField(
                hintText: 'Name',
                suffixIcon: Icons.done,
              ),
              SizedBox(height: Get.height * 0.02),
              const DoctorCustomTextField(
                hintText: 'Email',
                suffixIcon: Icons.done,
              ),
              SizedBox(height: Get.height * 0.02),
              const DoctorCustomTextField(
                obscureText: true,
                hintText: 'Password',
                suffixIcon: Icons.remove_red_eye_sharp,
              ),
              SizedBox(height: Get.height * 0.02),
              const DoctorCustomTextField(
                obscureText: true,
                hintText: 'Confirm Password',
                suffixIcon: Icons.remove_red_eye_sharp,
              ),
              SizedBox(height: Get.height * 0.03),
              DoctorCustomButton(
                buttonText: 'Sign Up',
                onTap: () {
                  Get.to(const AccountCreated(),
                      transition: Transition.downToUp);
                },
              ),
              SizedBox(height: Get.height * 0.02),
              InkWell(
                onTap: () {
                  Get.to(const DoctorLoginScreen(),
                      transition: Transition.downToUp);
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.2),
              const DoctorCustomTextWidget(
                text: 'Sign in with social networks:',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                textColor: AppColors.primaryColor,
              ),
              SizedBox(height: Get.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: 40,
                    width: 100,
                    color: const Color(0xFFEAF0F5),
                    child: SvgPicture.asset(
                      'assets/images/facebook.svg',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: 40,
                    width: 100,
                    color: const Color(0xFFEAF0F5),
                    child: SvgPicture.asset(
                      'assets/images/twitter.svg',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: 40,
                    width: 100,
                    color: const Color(0xFFEAF0F5),
                    child: SvgPicture.asset(
                      'assets/images/google.svg',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
