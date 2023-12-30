import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_using_bloc/common/values/colors.dart';
import 'package:shop_app_using_bloc/pages/application/application_widgets.dart';
import 'package:shop_app_using_bloc/pages/register/bloc/register_bloc.dart';

import 'bloc/app_bloc.dart';


class ApplicationPage extends StatefulWidget {
  static const route = 'register';

  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appBLoC = context.read<AppBloc>();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Scaffold(
              body: buildPage(state.index),
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
                  currentIndex: state.index,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourElementText,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: (int value) {
                    appBLoC.add(TriggerAppEvent(value));
                    // setState(() {
                    //   selectedIndex = value;
                    // });
                  },
                  items: bottomNavBars,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
