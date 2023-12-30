import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_using_bloc/common/values/constant.dart';
import 'package:shop_app_using_bloc/common/widget/flutter_toast.dart';
import 'package:shop_app_using_bloc/pages/application/application_page.dart';
import 'package:shop_app_using_bloc/pages/sign_in/bloc/sign_in_bloc.dart';

import '../../global.dart';

class SignInController {

  final BuildContext context;

  SignInController(this.context);

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        final email = state.email;
        final password = state.password;

        if (email.isEmpty) {
          toastInfo(message: "email is empty");
        }
        if (password!.isEmpty) {
          toastInfo(message: "password is empty");
        }
        try {
          // print("implementing firebase auth signup");
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          print("cred $credentials");
          if (credentials.user == null) {
            toastInfo(message: "user does not exist");
          }
          if (!credentials.user!.emailVerified) {
            toastInfo(message: "not verified");
          }
          var user = credentials.user;
          if (user != null) {
            Global.storageService.setString(AppConstant.STORAGE_USER_TOKEN_KEY, '1234567');
            Navigator.pushReplacementNamed(context, ApplicationPage.route);
          }

        } on FirebaseAuthException catch (e) {
          print("firebase exception");
          if (e.code == 'user-not-found') {
            toastInfo(message: "user not found");
          } else if (e.code == 'wrong-password') {
            toastInfo(message: "wrong password");
          } else if (e.code == 'invalid-email') {
            toastInfo(message: "invalid email");
          } else {
            toastInfo(message: e.code);
          }
        } catch (e) {
          toastInfo(message: "something went wrong!");
        }
      }
    } catch (e) {}
  }
}
