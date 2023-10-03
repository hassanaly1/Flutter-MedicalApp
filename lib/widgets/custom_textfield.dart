import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double? height;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: TextFormField(
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            border: InputBorder.none,
            prefixIcon: Icon(
              prefixIcon,
              color: AppColors.primaryColor,
            ),
            hintText: hintText,
            suffixIcon: Icon(
              suffixIcon,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorCustomTextField extends StatelessWidget {
  final String hintText;
  final double? height;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const DoctorCustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
        child: TextFormField(
          style: GoogleFonts.domine(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            // focusedBorder: const OutlineInputBorder(
            //     gapPadding: 4.0,
            //     borderSide: BorderSide(
            //       color: AppColors.primaryColor,
            //     )),
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            border: InputBorder.none,
            hintText: hintText,
            suffixIcon: Icon(
              suffixIcon,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
