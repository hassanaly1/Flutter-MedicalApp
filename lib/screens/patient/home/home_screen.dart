// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/screens/doctor/doctor_splash_screen.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List boxes = [
    ['assets/images/general.png', 'General Health'],
    ['assets/images/mental.png', 'Mental Health'],
    ['assets/images/women.png', 'Women Health'],
    ['assets/images/men.png', 'Men Health'],
    ['assets/images/prescriptions.png', 'prescriptions'],
    ['assets/images/refills.png', 'Refills'],
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'OD LOGO',
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          textColor: AppColors.primaryColor,
                        ),
                        CustomTextWidget(
                          text: 'HUMANITY FIRST',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          textColor: Color(0XFFFF5C5C),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/saim.jpg'),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                const CustomTextWidget(
                  text: 'Welcome User',
                  textColor: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(5),
                  height: Get.height * 0.26,
                  decoration: BoxDecoration(
                      color: const Color(0XFFE8F3F1),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomTextWidget(
                              text:
                                  'Humanity is a great healer; doctors bridge the gap between suffering and recovery!We are the Online DoctorsWe believe in power of TA’HA and pay equal attention to Timeliness, Affordability, Humanity, Access to healthcare.',
                              textColor: AppColors.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomButton(
                              height: 30,
                              width: 200,
                              buttonText: 'Invite Friends & Famliy',
                              onTap: () {},
                              buttonColor: const Color(0XFF6575A9),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Image.asset(
                            'assets/images/nurse.png',
                            //  fit: BoxFit.cover,
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const CustomTextWidget(
                  text: 'WE TREAT ALL HEALTH CONDITIONS SUCH AS:',
                  textColor: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: boxes.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0),
                  itemBuilder: (context, index) {
                    return Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(boxes[index][0]),
                          CustomTextWidget(
                            text: boxes[index][1],
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            textColor: const Color(0XFFFF5C5C),
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: CustomTextWidget(
                text: 'Hello User',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                textColor: Colors.white,
              )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const CustomTextWidget(
              text: 'Home',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const CustomTextWidget(
              text: 'Settings',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const CustomTextWidget(
              text: 'Doctor Panel',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            onTap: () {
              Get.to(const DoctorSplashScreen(),
                  transition: Transition.cupertino); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
