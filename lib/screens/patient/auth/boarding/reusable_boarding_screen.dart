// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';

class ReUsableBoardingScreen extends StatefulWidget {
  final String text;
  const ReUsableBoardingScreen({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ReUsableBoardingScreen> createState() => _ReUsableBoardingScreenState();
}

class _ReUsableBoardingScreenState extends State<ReUsableBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: const Alignment(0, 0.75),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //  mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextWidget(
                text: widget.text,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
