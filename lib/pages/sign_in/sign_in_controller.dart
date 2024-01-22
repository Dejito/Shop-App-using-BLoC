import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app_using_bloc/common/apis/user_api.dart';
import 'package:shop_app_using_bloc/common/entities/entities.dart';
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
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            String? email = user.email;
            String? displayName = user.displayName;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity(
              // type: 1,
              // avatar: photoUrl,
              email: email,
              name: displayName,
              // open_id: id
            );
            asyncPostAllData(loginRequestEntity);


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

  void asyncPostAllData(LoginRequestEntity loginRequestEntity){
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true
    );
    var result = UserAPI.login(params: loginRequestEntity);
    print('resulta is >>>>$result');
  }

}
