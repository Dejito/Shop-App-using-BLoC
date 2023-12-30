
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_using_bloc/common/values/constant.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    print("$_prefs is ----");
    return this;
  }

  Future<void> setBool(String key, bool value) async {
    print("pref is $_prefs");
    await _prefs.setBool(key, value);
    print('just to set bool');
  }

  bool getDeviceFirstOpen() {
    print("${_prefs.getBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME)}");
    return _prefs.getBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

}