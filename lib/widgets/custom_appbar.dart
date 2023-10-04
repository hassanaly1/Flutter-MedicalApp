import 'package:flutter/material.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';

AppBar CustomAppBarWidget(
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

AppBar DoctorCustomAppBarWidget(
    {required String title,
    Color? textColor,
    List<Widget>? action,
    Widget? leading,
    bool? automaticallyImplyLeading}) {
  return AppBar(
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    leading: leading,
    title: DoctorCustomTextWidget(
      text: title,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      textColor: textColor ?? AppColors.primaryColor,
    ),
    centerTitle: true,
    backgroundColor: AppColors.backgroundColor,
    elevation: 0,
    actions: action,
  );
}
