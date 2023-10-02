import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/screens/patient/auth/boarding/reusable_boarding_screen.dart';
import 'package:medical_app/screens/patient/auth/login_screen.dart';
import 'package:medical_app/screens/patient/auth/signup_screen.dart';
import 'package:medical_app/start_screen.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  late VideoPlayerController _videoController;
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const StartScreen(),
          ));
    });
    _videoController =
        VideoPlayerController.asset('assets/images/splash-video.mp4')
          ..initialize().then((_) {
            setState(() {
              // Start playing the video once it's initialized
              _videoController.play();
              debugPrint('Video starts playing.');
            });
          });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            VideoPlayer(_videoController), // Display the video
            PageView(
              controller: _controller,
              children: const [
                ReUsableBoardingScreen(
                  text:
                      'Don’t wait hours to visit a doctor. Prioritize your health with Online Doctors, and get access to healthcare within 10 minutes. We are restoring humanity’s touch to fast care',
                ),
                ReUsableBoardingScreen(
                  text:
                      'We aspire to create a system where no one is disqualified to receive health care. Get your health back with just \$1',
                ),
                ReUsableBoardingScreen(
                  text:
                      'Humanity First! Can’t afford healthcare due to financial reasons? Visit Online Doctors, where no one is disqualified to see a doctor.',
                ),
                ReUsableBoardingScreen(
                  text:
                      'Spend your valuable time with your loved ones, not in the clinic lin-ups. With Online Doctors get access to a healthcare in Just 1 Minute',
                ),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.9),
              child: SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primaryColor,
                      strokeWidth: 1,
                      dotHeight: 5)),
            ),
            Align(
              alignment: const Alignment(0, 0.95),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.offAll(
                        const LoginScreen(),
                        transition: Transition.downToUp,
                      );
                    },
                    child: const CustomTextWidget(
                      text: 'Sign-in',
                      textColor: AppColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAll(const SignUpScreen(),
                          transition: Transition.downToUp);
                    },
                    child: const CustomTextWidget(
                      text: 'Register',
                      textColor: AppColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
