import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/screens/patient/auth/forgot_password_screen.dart';
import 'package:medical_app/screens/patient/auth/signup_screen.dart';
import 'package:medical_app/screens/patient/home/bottom_navigation_bar.dart';
import 'package:medical_app/widgets/custom_appbar.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';
import 'package:medical_app/widgets/custom_textfield.dart';
import 'package:medical_app/widgets/success_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWidget(title: 'Login'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      Get.to(const ForgotPasswordScreen(),
                          transition: Transition.downToUp);
                    },
                    child: const CustomTextWidget(
                      text: 'Forgot Password?',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      textColor: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    buttonText: 'Login',
                    onTap: () {
                      setState(
                        () {
                          Get.dialog(SuccessDialog(
                            onTap: () {
                              Get.offAll(const BottomBar(),
                                  transition: Transition.downToUp);
                            },
                            text: 'Welcome Back Bakhair!',
                            subText:
                                'Once again you login successfully into OnlineDoctors app.',
                            buttonText: 'Go to Home',
                          ));
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const SignUpScreen(),
                          transition: Transition.downToUp);
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomTextWidget(text: "OR"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomLoginButton(
                    onTap: () {},
                    buttonText: 'Sign in with Google',
                    imagePath: 'assets/images/google-logo.png',
                    textColor: Colors.black,
                    borderColor: Colors.black87,
                    buttonColor: Colors.transparent,
                  ),
                  CustomLoginButton(
                    onTap: () {},
                    buttonText: 'Sign in with Facebook',
                    imagePath: 'assets/images/facebook-logo.png',
                    textColor: Colors.black,
                    borderColor: Colors.black87,
                    buttonColor: Colors.transparent,
                  ),
                  CustomLoginButton(
                    onTap: () {},
                    buttonText: 'Sign in with Apple',
                    imagePath: 'assets/images/apple-logo.png',
                    textColor: Colors.black,
                    borderColor: Colors.black87,
                    buttonColor: Colors.transparent,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLoginButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final double width;
  final String imagePath;
  const CustomLoginButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.width = double.infinity,
      this.buttonColor,
      this.textColor,
      this.borderColor,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
                color: buttonColor ?? AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
                border:
                    Border.all(color: borderColor ?? AppColors.primaryColor)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Image.asset(
                    imagePath,
                    height: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: CustomTextWidget(
                    text: buttonText,
                    fontSize: 16,
                    textColor: textColor ?? Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
