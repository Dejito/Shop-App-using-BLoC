import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_using_bloc/pages/register/bloc/register_bloc.dart';
import 'package:shop_app_using_bloc/pages/register/register_controller.dart';

import '../sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  static const route = 'register_screen';

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 45.h),
                    // buildThirdPartyLogin(context),
                    reusableText(
                        "Enter your details below and sign up for free"),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("username"),
                          buildTextField(
                            hintText: "Enter your username",
                            keyboardType: "email",
                            icon: "user",
                            onTextChanged: (String text) {
                             return registerBloc.add(UsernameEvent(text));
                            },
                          ),
                          SizedBox(
                            height: 18.w,
                          ),
                          reusableText("Email"),
                          buildTextField(
                            hintText: "Enter your email address",
                            keyboardType: "email",
                            icon: "user",
                            onTextChanged: (String text) {
                             return registerBloc.add(EmailEvent(text));
                            },
                          ),
                          SizedBox(
                            height: 18.w,
                          ),
                          reusableText(
                            "Password",
                          ),
                          buildTextField(
                            hintText: "Enter your password",
                            keyboardType: "password",
                            icon: 'lock',
                            onTextChanged: (String text) {
                             return registerBloc.add(PasswordEvent(text));
                            },
                          ),
                          SizedBox(
                            height: 18.w,
                          ),
                          reusableText(
                            "Confirm Password",
                          ),
                          buildTextField(
                            hintText: "Re-enter your password",
                            keyboardType: "password",
                            icon: 'lock',
                            onTextChanged: (String text) {
                             return registerBloc.add(RePasswordEvent(text));
                            },
                          ),
                          SizedBox(
                            height: 9.w,
                          ),
                          reusableText(
                            "By creating an account, you have to agree to our terms and conditions",
                          ),
                          buildLoginAndRegButton("Sign up", 'login', () {
                            RegisterController(context).handleEmailRegister();
                          }),
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
