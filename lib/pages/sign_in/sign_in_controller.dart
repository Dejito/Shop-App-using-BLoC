import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_using_bloc/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {

  final BuildContext context;

  SignInController(this.context);


  void handleSignIn(String type) {
    try {
      if(type == "email") {
        final state = context.read<SignInBloc>().state;
        if (state.email.isEmpty) {
          //
        }
        if (state.email.isEmpty) {
          //
        }

      }
    } catch (e) {

    }
  }

}