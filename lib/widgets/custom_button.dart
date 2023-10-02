import 'package:flutter/material.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final double width;
  final double? height;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.width = double.infinity,
      this.buttonColor,
      this.textColor,
      this.borderColor,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: height ?? 50,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor ?? AppColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: borderColor ?? AppColors.primaryColor)),
          child: Center(
              child: CustomTextWidget(
            text: buttonText,
            fontSize: 16,
            textColor: textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
          ))),
    );
  }
}
