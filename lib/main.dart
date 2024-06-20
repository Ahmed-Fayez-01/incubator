import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/root/app_root.dart';
import 'core/services/local/cache_helper/cache_helper.dart';
import 'core/services/remote/service_locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();

  runApp(const AppRoot());
}
