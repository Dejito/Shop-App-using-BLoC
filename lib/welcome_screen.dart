import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            children: [
              PageView(
                children: [
                  _page(
                    1,
                    context,
                    'next',
                    "First it was fragrance",
                    "And through desire, a man having separateth himself intermingleth with all knowlege!",
                  ),
                  _page(
                    2,
                    context,
                    'next',
                    "Connect with everyone",
                    "Then it turned to fire, my worship is my weapon, this is how I win my battles",
                  ),
                  _page(
                    3,
                    context,
                    'get started',
                    "This is how I win",
                    "And through desire, a man having separateth himself intermingleth with all knowlege!",
                  )
                ],
              ),
              Positioned (
                bottom: 50.h,
                child: DotsIndicator(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  dotsCount: 3,
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.blue,
                    size: const Size.square(8),
                    activeSize: const Size(10.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _page(int index, BuildContext context, String buttonName, String title,
    String subtitle) {
  return Column(
    children: [
      SizedBox(
        width: 345.w,
        height: 345.w,
        child: const Text("Image One"),
      ),
      Container(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 12.h),
        width: 375.w,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Text(
          subtitle,
          style: TextStyle(
            color: Colors.black.withOpacity(.5),
            fontSize: 14.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          // boxShadow: BoxShadow(
          //   color: Colors.grey.withOpacity(0.1),
          //   spreadRadius: 1,
          //   blurRadius: 2,
          //   offset: Offset(0, 1)
          // ),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    ],
  );
}
