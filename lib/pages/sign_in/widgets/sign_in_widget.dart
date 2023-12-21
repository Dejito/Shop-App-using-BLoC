import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    mainAxisSize: MainAxisSize.max,
    children: [
      reusableIcon("google", () {}),
      reusableIcon("apple", () {}),
      reusableIcon("facebook", () {}),
    ],
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
        border: Border.all(color: Colors.black)),
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
