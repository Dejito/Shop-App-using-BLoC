import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_using_bloc/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController(this.context);

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        final email = state.email;
        final password = state.password;

        if (email.isEmpty) {
          //
          print("email empty");
        }
        if (password!.isEmpty) {
          //
          print("password empty");
        }
        try {
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (credentials.user == null) {
            print("user does not exist");
          }
          if (!credentials.user!.emailVerified) {
            print("not verified");
          }
          var user = credentials.user;
          if (user != null) {}

        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('no user');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided');
          } else if (e.code == 'invalid-email') {
            print("your email format is wrong");

          }
        } catch (e) {
          print("something went wrong!");
        }
      }
    } catch (e) {}
  }
}
