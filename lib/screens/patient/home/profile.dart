import 'package:flutter/material.dart';
import 'package:medical_app/widgets/custom_appbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWidget(title: 'Profile'),
    );
  }
}
