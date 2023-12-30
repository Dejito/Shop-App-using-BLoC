import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_using_bloc/common/service/storage_service.dart';


class Global {
  late StorageService storageService;

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    storageService = StorageService().init() as StorageService;
  }
}