import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_using_bloc/common/values/colors.dart';

Widget buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset('assets/icons/menu.png'),
        ),
        Text(
          "Profile",
          style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset('assets/icons/more-vertical.png'),
        ),
      ],
    ),
  );
}

Widget profileIconAndEditPicture() {
  return Container(
    alignment: Alignment.bottomRight,
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image:
          const DecorationImage(image: AssetImage('assets/icons/headpic.png')),
    ),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: AssetImage('assets/icons/edit_3.png'),
    ),
  );
}

var imagesInfo = <String, String>{
  'Settings': "settings.png",
  'Payment details': 'credit-card.png',
  'Love': 'award.png'
};

Widget buildListView() {
  return Column(
    children: [
      ...List.generate(imagesInfo.length, (index) =>
      GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: 25.w, top: 20.h),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: AppColors.primaryElement
                ),
                padding: const EdgeInsets.all(7),
                child: Image.asset('assets/icons/${imagesInfo.values.elementAt(index)}'),
              ),
              SizedBox(width: 15.w),
              Text(
                imagesInfo.keys.elementAt(index),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ],
          ),
        ),
      )
      )
    ],
  );
}