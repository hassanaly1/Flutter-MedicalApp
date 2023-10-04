import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/widgets/custom_appbar.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';
import 'package:medical_app/widgets/custom_textfield.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorCustomAppBarWidget(title: 'Reset Password'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DoctorCustomTextWidget(
              text: 'Enter new password and confirm.',
              textAlign: TextAlign.center,
              fontSize: 16,
              fontWeight: FontWeight.w400,
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
            SizedBox(height: Get.height * 0.02),
            DoctorCustomButton(
              buttonText: 'Change Password',
              onTap: () {
                Get.to(const ResetPasswordScreen(),
                    transition: Transition.rightToLeft);
              },
            )
          ],
        ),
      ),
    );
  }
}
