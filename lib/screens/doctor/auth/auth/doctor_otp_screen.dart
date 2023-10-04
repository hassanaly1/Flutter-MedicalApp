import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/widgets/custom_appbar.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';
import 'package:pinput/pinput.dart';

class DoctorOtpScreen extends StatefulWidget {
  const DoctorOtpScreen({
    super.key,
  });

  @override
  _DoctorOtpScreenState createState() => _DoctorOtpScreenState();
}

class _DoctorOtpScreenState extends State<DoctorOtpScreen> {
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
      appBar: DoctorCustomAppBarWidget(title: 'Verify your phone number'),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const DoctorCustomTextWidget(
                  text:
                      'We have sent you an SMS with a code to number +17 0123456789.',
                  fontSize: 20,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 10.0),
                // CustomTextWidget(
                //   text: widget.text,
                //   textColor: const Color(0XFF717784),
                //   fontSize: 15,
                // ),
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
                        // Get.to(const NewPasswordScreen(),
                        //     transition: Transition.rightToLeft);
                      }
                      setState(() {
                        _pinController.clear();
                        _timerInProgress = false;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
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
                const SizedBox(height: 20.0),
                DoctorCustomButton(
                  buttonText: 'Verify',
                  onTap: () {
                    // Validate OTP and perform actions
                    String enteredOTP = _pinController.text;
                    if (enteredOTP.length == 4) {
                      // Perform validation and actions here
                    }
                  },
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
