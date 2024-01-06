import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_using_bloc/common/routes/routes.dart';
import 'package:shop_app_using_bloc/common/values/constant.dart';
import 'package:shop_app_using_bloc/global.dart';
import 'package:shop_app_using_bloc/pages/application/bloc/app_bloc.dart';
import 'package:shop_app_using_bloc/pages/profile/settings/settings_widget/settings_widget.dart';

import 'bloc/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  static const route = 'settings_page';

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData(BuildContext context) {
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    Global.storageService.removeString(AppConstant.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.signIn, (route) => false);
    // pushReplacementNamed(AppRoutes.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  logoutButton(context, () => removeUserData(context))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
