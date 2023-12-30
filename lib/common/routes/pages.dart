import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_using_bloc/common/routes/names.dart';
import 'package:shop_app_using_bloc/common/routes/pages.dart';
import 'package:shop_app_using_bloc/common/routes/pages.dart';
import 'package:shop_app_using_bloc/pages/application/application_page.dart';
import 'package:shop_app_using_bloc/pages/application/bloc/app_bloc.dart';
import 'package:shop_app_using_bloc/pages/register/bloc/register_bloc.dart';
import 'package:shop_app_using_bloc/pages/register/register.dart';
import 'package:shop_app_using_bloc/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:shop_app_using_bloc/pages/sign_in/sign_in.dart';
import 'package:shop_app_using_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:shop_app_using_bloc/pages/welcome/welcome_screen.dart';

class AppPages {
 static  List<PageEntity> routes() {
   return <PageEntity>[
     PageEntity(
       route: AppRoutes.initial,
       page: const Welcome(),
       bloc: BlocProvider(create: ( context) => WelcomeBloc(),),
     ),
     PageEntity(
       route: AppRoutes.signIn,
       page: const SignIn(),
       bloc: BlocProvider(create: (context) => SignInBloc(),),
     ),
     PageEntity(
       route: AppRoutes.register,
       page: const Register(),
       bloc: BlocProvider(create: (context) => RegisterBloc(),),
     ),
     PageEntity(
       route: AppRoutes.application,
       page: const ApplicationPage(),
       bloc: BlocProvider(create: (context) => AppBloc(),),
     ),
   ];
 }

 static List allBlocProviders (BuildContext context) {
   List blocProviders = [];
   for (var bloc in routes()) {
     blocProviders.add(bloc.bloc);
   }
   print("bloc provs are $blocProviders");
   return blocProviders;
 }

 static MaterialPageRoute generateRouteSettings (RouteSettings settings ) {
   if (settings.name != null) {
     // print('setting 1 is ${settings.name}');
     var result = routes().where((element) => element.route == settings.name);
     if (result.isNotEmpty) {
       return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
     }
   }
   // print('setting 2 is ${settings.name}');
   return MaterialPageRoute(builder: (_) => const Welcome(), settings: settings);
 }

}



class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
