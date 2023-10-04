import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/screens/patient/auth/login_screen.dart';
import 'package:medical_app/widgets/custom_appbar.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';
import 'package:medical_app/widgets/custom_textfield.dart';
import 'package:medical_app/widgets/success_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Sign Up'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomTextField(
                    hintText: 'Enter your Name',
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.person_2_rounded,
                  ),
                  const SizedBox(height: 15),
                  const CustomTextField(
                    hintText: 'Enter your Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email_rounded,
                  ),
                  const SizedBox(height: 15),
                  const CustomTextField(
                    hintText: 'Enter your Password',
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.lock_outline_rounded,
                    suffixIcon: Icons.remove_red_eye_rounded,
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        icon: Icon(isChecked
                            ? Icons.check_box_rounded
                            : Icons.check_box_outline_blank),
                      ),
                      const SizedBox(width: 5),
                      const CustomTextWidget(
                        text:
                            'I agree to the medidoc Terms of Service and \nPrivacy Policy',
                        textColor: AppColors.primaryColor,
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    buttonText: 'Sign Up',
                    onTap: () {
                      setState(() {
                        Get.dialog(SuccessDialog(
                          onTap: () {
                            Get.offAll(const LoginScreen(),
                                transition: Transition.downToUp);
                          },
                          text: 'Success',
                          subText:
                              'Your account has been successfully registered.',
                          buttonText: 'Login',
                        ));
                      });
                    },
                  ),
                  const SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      Get.to(const LoginScreen(),
                          transition: Transition.downToUp);
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
