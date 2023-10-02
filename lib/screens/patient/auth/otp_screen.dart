import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/screens/patient/auth/new_password_screen.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  final String text;
  const OTPScreen({super.key, required this.text});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _pinController = TextEditingController();

  bool _timerInProgress = true;
  int _start = 5;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          _timerInProgress = false;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const CustomTextWidget(
                  text: 'Enter Verification Code',
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 10.0),
                CustomTextWidget(
                  text: widget.text,
                  textColor: const Color(0XFF717784),
                  fontSize: 15,
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Pinput(
                    controller: _pinController,
                    validator: (s) {
                      return s == '2222' ? null : 'Pin is incorrect';
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) {
                      if (pin == '2222') {
                        Get.to(const NewPasswordScreen(),
                            transition: Transition.rightToLeft);
                      }
                      setState(() {
                        _pinController.clear();
                        _timerInProgress = false;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20.0),

                const SizedBox(height: 20.0),
                CustomButton(
                  buttonText: 'Verify',
                  onTap: () {
                    // Validate OTP and perform actions
                    String enteredOTP = _pinController.text;
                    if (enteredOTP.length == 4) {
                      // Perform validation and actions here
                    }
                  },
                ),
                const SizedBox(height: 10),
                _timerInProgress
                    ? Center(
                        child: CustomTextWidget(
                          textAlign: TextAlign.center,
                          text: 'Resend OTP in $_start seconds',
                          textColor: const Color(0XFF717784),
                          fontSize: 15,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomTextWidget(
                            text: 'Didn’t receive the code?',
                            textColor: Color(0XFF717784),
                            fontSize: 15,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _timerInProgress = true;
                                _start = 5;
                              });
                              _pinController.clear();
                              startTimer();
                            },
                            child: const CustomTextWidget(
                              text: 'Resend',
                              textColor: AppColors.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
