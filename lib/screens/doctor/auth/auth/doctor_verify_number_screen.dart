import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/screens/doctor/auth/auth/doctor_otp_screen.dart';
import 'package:medical_app/widgets/custom_appbar.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';

class DoctorVerifyNumberScreen extends StatefulWidget {
  CountryCode? countryCode;
  DoctorVerifyNumberScreen({super.key});

  @override
  State<DoctorVerifyNumberScreen> createState() =>
      _DoctorVerifyNumberScreenState();
}

class _DoctorVerifyNumberScreenState extends State<DoctorVerifyNumberScreen> {
  final countryPicker = const FlCountryCodePicker(
    localize: true,
    showDialCode: true,
    showSearchBar: true,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.countryCode = const CountryCode(
      name: 'USA',
      code: '',
      dialCode: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorCustomAppBarWidget(title: 'Verify your phone number'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DoctorCustomTextWidget(
              text:
                  'We have sent you an SMS with a code to number +17 0123456789.',
              textAlign: TextAlign.center,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: Get.height * 0.02),
            GestureDetector(
              onTap: () async {
                widget.countryCode =
                    await countryPicker.showPicker(context: context);
                if (widget.countryCode != null) {
                  debugPrint(widget.countryCode!.dialCode);
                }
                setState(() {});
              },
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 10),
                      height: 50,
                      width: 80,
                      color: Colors.grey.shade200,
                      child: Center(
                        child: CustomTextWidget(
                          // ignore: dead_code
                          text: widget.countryCode?.dialCode ?? "",
                          fontSize: 22,
                        ),
                      )),
                  const CustomTextWidget(
                    text: '|',
                    textColor: Colors.black,
                    fontSize: 50,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 10),
                      height: 50,
                      width: Get.width * 0.65,
                      color: Colors.grey.shade200,
                      child: const CustomTextWidget(
                        text: '123456+789',
                        textAlign: TextAlign.start,
                        fontSize: 22,
                      )),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            DoctorCustomButton(
              buttonText: 'Confirm',
              onTap: () {
                Get.to(const DoctorOtpScreen(),
                    transition: Transition.rightToLeft);
              },
            )
          ],
        ),
      ),
    );
  }
}
