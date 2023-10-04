import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/screens/doctor/auth/auth/doctor_login_screen.dart';
import 'package:medical_app/screens/doctor/auth/boarding/doctor_reusable_screen.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DoctorBoardingScreen extends StatefulWidget {
  const DoctorBoardingScreen({Key? key}) : super(key: key);

  @override
  State<DoctorBoardingScreen> createState() => _DoctorBoardingScreenState();
}

class _DoctorBoardingScreenState extends State<DoctorBoardingScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: const [
                DoctorReUsableBoardingScreen(
                  text: 'Welcome to Demicle',
                  subText:
                      'Labore sunt culpa excepteur culpa occaecat ex nisi mollit.',
                  imagePath: 'assets/images/1.svg',
                ),
                DoctorReUsableBoardingScreen(
                  text: 'Find your doctor and Make an appointment with ease!',
                  subText:
                      'Labore sunt culpa excepteur culpa occaecat ex nisi mollit.',
                  imagePath: 'assets/images/2.svg',
                ),
                DoctorReUsableBoardingScreen(
                  text: 'Welcome to Demicle',
                  subText:
                      'Labore sunt culpa excepteur culpa occaecat ex nisi mollit.',
                  imagePath: 'assets/images/3.svg',
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: const Alignment(0, 0.2),
                    child: SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                            activeDotColor: AppColors.primaryColor,
                            strokeWidth: 1,
                            dotHeight: 5)),
                  ),
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DoctorCustomButton(
                      buttonText: 'Get Started',
                      onTap: () {
                        Get.to(const DoctorLoginScreen(),
                            transition: Transition.rightToLeftWithFade);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
