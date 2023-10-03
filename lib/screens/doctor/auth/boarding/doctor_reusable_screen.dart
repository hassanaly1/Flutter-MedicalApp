// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';

class DoctorReUsableBoardingScreen extends StatefulWidget {
  final String text;
  final String subText;
  final String imagePath;
  const DoctorReUsableBoardingScreen({
    Key? key,
    required this.text,
    required this.subText,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<DoctorReUsableBoardingScreen> createState() =>
      _DoctorReUsableBoardingScreenState();
}

class _DoctorReUsableBoardingScreenState
    extends State<DoctorReUsableBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.02),
              DoctorCustomTextWidget(
                text: widget.text,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                textColor: const Color(0XFF123258),
              ),
              const SizedBox(height: 25),
              SvgPicture.asset(
                widget.imagePath,
                height: 300,
              ),
              SizedBox(height: Get.height * 0.1),
              DoctorCustomTextWidget(
                text: widget.subText,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                textColor: const Color(0XFF4C6780),
              ),
            ],
          )),
    );
  }
}
