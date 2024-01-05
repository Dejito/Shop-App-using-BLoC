import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_using_bloc/pages/home/bloc/homepage_bloc.dart';

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
                        image: AssetImage("assets/icons/person.png"))),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget SearchView() {
  return Container(
    child: Row(
      children: [
        Container(
          height: 40.h,
          width: 280.w,
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.circular(15.h),
              border: Border.all(color: AppColors.primaryFourElementText)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
                width: 16.w,
                height: 16.h,
                child: Image.asset('assets/icons/search.png'),
              ),
              Container(
                width: 240.w,
                height: 40.h,
                child: TextField(
                  // onChanged: (value) => onTextChanged!(value),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                      hintText: "search for your course",
                      hintStyle: TextStyle(
                          fontFamily: "Avenir",
                          color: Colors.grey.withOpacity(.9),
                          fontWeight: FontWeight.normal),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                  obscureText: false,
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(color: AppColors.primaryElement),
            ),
            child: Image.asset('assets/icons/options.png'),
          ),
        )
      ],
    ),
  );
}

Widget slidersView({required BuildContext context, required HomepageState state}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomepageBloc>().add(HomePageDots(value));
            // print(state.index);
          },
          children: [
            sliderContainer('art'),
            sliderContainer('Image(1)'),
            sliderContainer('Image(2)'),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17, 5),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            )


          ),
        ),
      )
    ],
  );
}

Widget sliderContainer(String imageName) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(
        20.h,
      )),
      image: DecorationImage(
          image: AssetImage("assets/icons/$imageName.png"), fit: BoxFit.fill),
    ),
  );
}
