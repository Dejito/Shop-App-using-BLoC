import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_using_bloc/pages/sign_in/sign_in_controller.dart';
import 'package:shop_app_using_bloc/pages/sign_in/widgets/sign_in_widget.dart';

import 'bloc/sign_in_bloc.dart';

class SignIn extends StatefulWidget {
  static const route = "sign_in";

  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final signInBloc = context.read<SignInBloc>();
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    buildThirdPartyLogin(context),
                    reusableText("Or use email account to login"),
                    Container(
                      margin: EdgeInsets.only(top: 66.h),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Email"),
                          buildTextField(
                            hintText: "Enter your email address",
                            keyboardType: "email",
                            icon: "user",
                            onTextChanged: (String text) =>
                                signInBloc.add(EmailEvent(email: text)),
                          ),
                          SizedBox(
                            height: 18.w,
                          ),
                          reusableText(
                            "Password",
                          ),
                          buildTextField(
                              hintText: "Enter your email password",
                              keyboardType: "password",
                              icon: 'lock',
                              onTextChanged: (text) =>
                                  context.read<SignInBloc>().add(
                                        PasswordEvent(password: text),
                                      )),
                          forgotPassword(),
                          buildLoginAndRegButton("Login", 'login', () {
                            // SignInController(context).handleSignIn('email');
                          }
                           ),
                          buildLoginAndRegButton("Register", 'reg', () {
                            SignInController(context).handleSignIn('email');
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
