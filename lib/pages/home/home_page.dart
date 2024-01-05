import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_using_bloc/common/values/colors.dart';
import 'package:shop_app_using_bloc/pages/home/widget/home_page_widget.dart';

import 'bloc/homepage_bloc.dart';

class HomePage extends StatefulWidget {
  static const route = '/homepage';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomePageAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
        child: BlocBuilder<HomepageBloc, HomepageState>(
          builder: (context, state) {
            return CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: homePageText('Hello',
                    color: AppColors.primaryThreeElementText),
              ),
              SliverToBoxAdapter(
                child: homePageText('Jito tech', top: 5),
              ),

              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),

              SliverToBoxAdapter(
                child: SearchView(),
              ),

              SliverToBoxAdapter(
                child: slidersView(context: context, state: state),
              ),

              SliverToBoxAdapter(
                child: menuView(),
              ),

              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6),
                  delegate: SliverChildBuilderDelegate(
                      childCount: 4,
                      (context, index) =>
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Best course for IT",
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryElementText
                              ),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icons/Image(1).png")
                        )
                      ),
                    ),
                  )
                  ),
                ),
              )
              // ],
              // ),
            ]

                // children: [

                // ],
                );
          },
        ),
      ),
    );
  }
}
