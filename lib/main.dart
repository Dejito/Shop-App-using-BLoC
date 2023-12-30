import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_using_bloc/common/routes/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shop_app_using_bloc/global.dart';

void main() async {
  try {
    await Global().init();
    runApp(const MyApp());
    if (kDebugMode) {
      print("firebase init'd >>>>>>");
    }
  } catch (e) {
    if (kDebugMode) {
      print("firebase ngmi>>>>>>");
    }
    // runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            appBarTheme:
                const AppBarTheme(elevation: 0, backgroundColor: Colors.white),
            useMaterial3: true,
          ),
          // home: const ApplicationPage(),
          // // Welcome(),
          // routes: {
          //   SignIn.route: (context) => const SignIn(),
          //   Register.route: (context) => const Register(),
          // },
          onGenerateRoute: AppPages.generateRouteSettings,
        ),
      ),
    );
  }
}
