import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar = AppBar(
  bottom: PreferredSize(
    preferredSize: const Size.fromHeight(1.0),
    child: Container(
      color: Colors.grey.withOpacity(.5),
      height: 1.0,
    ),
  ),
  title: const Center(
    child: Text(
      "Log In",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        reusableIcon("google", () {}),
        reusableIcon("apple", () {}),
        reusableIcon("facebook", () {}),
      ],
    ),
  );
}

Widget reusableIcon(String icon, Function() onClick) {
  return GestureDetector(
    onTap: onClick,
    child: Container(
      margin: const EdgeInsets.only(top: 40, bottom: 20),
      height: 40.h,
      width: 40.w,
      child: Image.asset("assets/icons/$icon.png"),
    ),
  );
}

Widget reusableText(String text) {
  return SizedBox(
    child: Text(
      text,
      style: TextStyle(color: Colors.grey.withOpacity(.9)),
    ),
  );
}

Widget buildTextField({required String hintText, required String icon, required String keyboardType}) {
  return Container(
    margin: EdgeInsets.only(top: 5.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.primaryFourElementText)),
    child: Row(
      children: [
        Container(
          height: 16.h,
          width: 16.w,
          margin: EdgeInsets.only(left: 15.w),
          child: Image.asset("assets/icons/$icon.png"),
        ),
        SizedBox(
          width: 270.w, height: 50.w,
          child:  TextField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:  TextStyle(
                fontFamily: "Avenir",
                  color: Colors.grey.withOpacity(.9),
                fontWeight: FontWeight.normal
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none
              )
            ),
            obscureText: keyboardType == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(top:15.h),
    width: 260.w, height: 44.h,
    child: GestureDetector(
      onTap: (){},
      child: const Text(
        "Forgot Password",
        style: TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue
        ),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, String buttonType) {
  return GestureDetector(
    child: Container(
      width: 350.w, height: 50.h,
      margin: EdgeInsets.only( top: buttonType == "login" ? 40.h : 20.h),
      decoration: BoxDecoration(
        color: buttonType == 'login' ? AppColors.primaryElement : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: buttonType == 'login' ? Colors.transparent : AppColors.primaryFourElementText,),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1)
          )
        ]
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color: buttonType == 'login' ? Colors.white : Colors.black,
            fontSize: 16
          ),
        ),
      ),
    ),
  );
}