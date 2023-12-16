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
                  Column(
                    children: [
                      SizedBox(
                        width: 345.w, height: 345.w,
                        child: const Text(
                            "Image One"
                        ),
                      ),
                      Container(
                        child: Text(
                          "First See Learning!",
                          style: TextStyle(
                            fontSize: 24.sp,

                          ),
                        ),
                      ),
                      Container(
                        width: 375.w,
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          "And through desire, man having separateth himself intermingleth with all knowlege!",
                          style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                            fontSize: 14.sp,

                          ),
                        ),
                      ),
                      Container(
                        width: 325.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(15.w))
                        ),
                      )
                    ],
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
