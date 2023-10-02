import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/constants/colors.dart';
import 'package:medical_app/screens/patient/home/doctors.dart';
import 'package:medical_app/screens/patient/home/health.dart';
import 'package:medical_app/screens/patient/home/home_screen.dart';
import 'package:medical_app/screens/patient/home/profile.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          HomeScreen(),
          const Doctor(),
          const Health(),
          const Profile(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Get.height * 0.1,
            child: CupertinoTabBar(
                backgroundColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        FluentIcons.home_12_filled,
                        color: _page == 0 ? Colors.black87 : Colors.black45,
                      ),
                      label: 'Home',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                      icon: Icon(FluentIcons.doctor_12_filled,
                          color: _page == 1 ? Colors.black87 : Colors.black45),
                      label: 'Doctor',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.health_and_safety,
                          color: _page == 2 ? Colors.black87 : Colors.black45),
                      label: 'My Health',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.more_horiz,
                          color: _page == 3 ? Colors.black87 : Colors.black45),
                      label: 'More',
                      backgroundColor: Colors.white),
                ],
                onTap: navigationTapped),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: const Icon(
                      Icons.call,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
                    child: const CustomTextWidget(
                      text: 'CALL DOCTOR',
                      textColor: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(
                    Icons.health_and_safety,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
