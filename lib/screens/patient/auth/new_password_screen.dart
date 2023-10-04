import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/screens/patient/auth/login_screen.dart';
import 'package:medical_app/widgets/custom_appbar.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';
import 'package:medical_app/widgets/custom_textfield.dart';
import 'package:medical_app/widgets/success_dialog.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const CustomTextWidget(
              text: 'Create New Password',
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 15),
            const CustomTextWidget(
              text: 'Create your new password to login',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              textColor: Colors.grey,
            ),
            const SizedBox(height: 15),
            const CustomTextField(
              hintText: 'Enter New Password',
              keyboardType: TextInputType.text,
              prefixIcon: Icons.lock_outline_rounded,
              suffixIcon: Icons.remove_red_eye_rounded,
              obscureText: true,
            ),
            const SizedBox(height: 15),
            const CustomTextField(
              hintText: 'ConfirmPassword',
              keyboardType: TextInputType.text,
              prefixIcon: Icons.lock_outline_rounded,
              suffixIcon: Icons.remove_red_eye_rounded,
              obscureText: true,
            ),
            const SizedBox(height: 25),
            CustomButton(
              buttonText: 'Create Password',
              onTap: () {
                setState(
                  () {
                    Get.dialog(SuccessDialog(
                      onTap: () {
                        Get.offAll(const LoginScreen(),
                            transition: Transition.downToUp);
                      },
                      text: 'Success',
                      subText: 'You have successfully reset your password.',
                      buttonText: 'Login',
                    ));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
