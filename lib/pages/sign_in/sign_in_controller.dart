import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_using_bloc/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {

  final BuildContext context;

  SignInController(this.context);


  void handleSignIn(String type) async {
    try {
      if(type == "email") {
        final state = context.read<SignInBloc>().state;
        final email = state.email;
        final password = state.password;

        if (email.isEmpty) {
          //
        }
        if (password!.isEmpty) {
          //
        }

        final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if (credentials.user == null) {

        }
        if (!credentials.user!.emailVerified) {

        }
        var user = credentials.user;
        if (user != null) {

        }
      }
    } catch (e) {

    }
  }

}