import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildHomePageAppBar() {
  return AppBar(
    title: SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 7.w, right: 7.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 15.w,
              height: 12.h,
              child: Image.asset('assets/icons/menu.png'),
            ),
            GestureDetector(
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/icons/person.png"
                        )
                    )
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget homePageText(String text, {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold
      ),
    ),
  );
}

Widget SearchView (){
  return Container(
    child: Row(
      children: [
        Container(
          height: 40.h,
          width: 280.h,
          decoration: BoxDecoration(
            color:
          ),
        )
      ],
    ),
  );
}