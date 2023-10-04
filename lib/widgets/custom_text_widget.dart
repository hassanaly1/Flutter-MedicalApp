import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/constants/colors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? textAlign;
  const CustomTextWidget(
      {super.key,
      required this.text,
      this.textColor,
      this.textAlign,
      this.fontSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w300,
        color: textColor ?? Colors.black,
      ),
    );
  }
}

class DoctorCustomTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? textAlign;
  const DoctorCustomTextWidget(
      {super.key,
      required this.text,
      this.textColor,
      this.textAlign,
      this.fontSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunitoSans(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w300,
        color: textColor ?? AppColors.primaryColor,
      ),
    );
  }
}
