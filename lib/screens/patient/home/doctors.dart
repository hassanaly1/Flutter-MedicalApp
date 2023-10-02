import 'package:flutter/material.dart';
import 'package:medical_app/widgets/custom_appbar.dart';

class Doctor extends StatelessWidget {
  const Doctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWidget(title: 'Doctor'),
    );
  }
}
