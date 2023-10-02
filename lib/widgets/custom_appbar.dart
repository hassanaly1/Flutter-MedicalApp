import 'package:flutter/material.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';

AppBar customAppBarWidget(
    {required String title,
    List<Widget>? action,
    Widget? leading,
    bool? automaticallyImplyLeading}) {
  return AppBar(
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    leading: leading,
    title: CustomTextWidget(
        text: title, fontSize: 20.0, fontWeight: FontWeight.w700),
    centerTitle: true,
    backgroundColor: AppColors.backgroundColor,
    elevation: 0,
    actions: action,
  );
}
