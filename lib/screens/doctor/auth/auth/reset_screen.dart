import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/screens/doctor/auth/auth/reset_password_screen.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            SvgPicture.asset('assets/images/reset.svg'),
            const DoctorCustomTextWidget(
              text: 'Your password has been Reset!',
              fontSize: 30,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
              textColor: AppColors.primaryColor,
            ),
            const DoctorCustomTextWidget(
              text:
                  'Qui ex aute ipsum duis. Incididunt adipisicing voluptate laborum',
              fontSize: 20,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              textColor: AppColors.primaryColor,
            ),
            const Spacer(),
            DoctorCustomButton(
              buttonText: 'Done',
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
