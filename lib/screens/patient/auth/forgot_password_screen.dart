import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/screens/patient/auth/otp_screen.dart';
import 'package:medical_app/widgets/custom_appbar.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';
import 'package:medical_app/widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            const SizedBox(height: 30),
            const CustomTextWidget(
              text: 'Forgot your Password?',
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 15),
            const CustomTextWidget(
              text:
                  'Enter your email or your phone number, we will send you confirmation code',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              textColor: Colors.grey,
            ),
            const SizedBox(height: 15),
            Container(
              height: 60,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
              ),
              child: TabBar(
                padding: const EdgeInsets.all(7),
                controller: _tabController,

                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                  color: Colors.white,
                ),
                labelStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Email',
                    height: 40,
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Phone',
                    height: 40,
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 25),
                      const CustomTextField(
                        hintText: 'Enter your Email',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.email_rounded,
                      ),
                      const SizedBox(height: 25),
                      CustomButton(
                        buttonText: 'Reset Password',
                        onTap: () {
                          Get.to(
                              const OTPScreen(
                                text:
                                    'Enter code that we have sent to your email ***@gmail.com',
                              ),
                              transition: Transition.rightToLeft);
                        },
                      )
                    ],
                  ),

                  // second tab bar view widget
                  Column(
                    children: [
                      const SizedBox(height: 25),
                      const CustomTextField(
                        hintText: 'Enter your Number',
                        keyboardType: TextInputType.number,
                        prefixIcon: Icons.call,
                      ),
                      const SizedBox(height: 25),
                      CustomButton(
                        buttonText: 'Reset Password',
                        onTap: () {
                          Get.to(
                              const OTPScreen(
                                text:
                                    'Enter code that we have sent to your number 08528188***',
                              ),
                              transition: Transition.rightToLeft);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
