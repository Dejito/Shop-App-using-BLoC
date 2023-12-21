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
      reusableIcon("google", (){}),
      reusableIcon("apple", (){}),
      reusableIcon("facebook", (){}),

    ],
  );
}


Widget reusableIcon(String icon, Function() onClick) {
  return GestureDetector(
    onTap: onClick,
    child: SizedBox(
      height: 40.h,
      width: 40.w,
      child: Image.asset("assets/icons/$icon.png"),
    ),
  );
}
