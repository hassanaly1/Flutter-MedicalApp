import 'package:flutter/material.dart';
import 'package:medical_app/widgets/custom_appbar.dart';

class Health extends StatelessWidget {
  const Health({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWidget(title: 'Health'),
    );
  }
}
