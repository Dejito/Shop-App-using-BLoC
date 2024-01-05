
import 'package:shop_app_using_bloc/pages/application/application_page.dart';
import 'package:shop_app_using_bloc/pages/home/home_page.dart';
import 'package:shop_app_using_bloc/pages/register/register.dart';
import 'package:shop_app_using_bloc/pages/sign_in/sign_in.dart';

class AppRoutes {
  static const initial = '/';
  static const application = ApplicationPage.route;
  static const signIn = SignIn.route;
  static const register = Register.route;
  static const homepage = HomePage.route;


}