import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_using_bloc/common/values/colors.dart';
import 'package:shop_app_using_bloc/pages/application/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(selectedIndex) ,
          bottomNavigationBar: Container(
            width: 375.w, height: 58.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.h),
                topLeft: Radius.circular(20.h),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1
                )
              ]
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourElementText,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (int value){
                setState(() {
                  selectedIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 15.h, width: 15.w,
                    child: Image.asset('assets/icons/home.png',
                    ),
                  ),
                  label: 'Home',
                  activeIcon: SizedBox(
                    height: 15.h, width: 15.w,
                    child: Image.asset('assets/icons/home.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                  // backgroundColor:
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 15.h, width: 15.w,
                    child: Image.asset('assets/icons/search2.png',
                    ),
                  ),
                  label: 'Home',
                  activeIcon: SizedBox(
                    height: 15.h, width: 15.w,
                    child: Image.asset('assets/icons/search2.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 15.h, width: 15.w,
                    child: Image.asset('assets/icons/play-circle1.png'),
                  ),
                  label: 'Home',
                  activeIcon: SizedBox(
                    height: 15.h, width: 15.w,
                    child: Image.asset('assets/icons/play-circle1.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 15.h, width: 15.w,
                    child: Image.asset('assets/icons/message-circle.png',
                    ),
                  ),
                  label: 'Home',
                  activeIcon: SizedBox(
                    height: 15.h, width: 15.w,
                    child: Image.asset('assets/icons/message-circle.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 15.h, width: 15.w,
                    child: Image.asset('assets/icons/person2.png',
                    ),
                  ),
                  label: 'Home',
                  activeIcon: SizedBox(
                    height: 15.h, width: 15.w,
                    child: Image.asset('assets/icons/person2.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
