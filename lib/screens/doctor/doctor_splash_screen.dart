import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/screens/doctor/auth/boarding/doctor_boarding_screen.dart';

class DoctorSplashScreen extends StatefulWidget {
  const DoctorSplashScreen({super.key});

  @override
  State<DoctorSplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<DoctorSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const DoctorBoardingScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Image.asset(
          'assets/images/driver-logo.PNG',
          height: 150,
        )));
  }
}
