import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/screens/doctor/auth/auth/reset_screen.dart';
import 'package:medical_app/widgets/custom_appbar.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';
import 'package:medical_app/widgets/custom_textfield.dart';

class DoctorForgetPasswordScreen extends StatelessWidget {
  const DoctorForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorCustomAppBarWidget(
          title: 'Forgot Password', textColor: AppColors.primaryColor),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const DoctorCustomTextWidget(
              text:
                  'Please enter your email address. You will receive a link to create a new password via email.',
              fontSize: 18,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              textColor: AppColors.primaryColor,
            ),
            const SizedBox(height: 30),
            const DoctorCustomTextField(hintText: 'Email'),
            const SizedBox(height: 30),
            DoctorCustomButton(
              buttonText: 'Send',
              onTap: () {
                Get.to(const ResetScreen(), transition: Transition.rightToLeft);
              },
            )
          ],
        ),
      ),
    );
  }
}
