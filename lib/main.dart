import 'package:check_maintain_frontend/config/constants/enviroment.dart';
import 'package:check_maintain_frontend/config/router/app_router.dart';

import 'package:check_maintain_frontend/config/theme/app_theme.dart';
import 'package:check_maintain_frontend/presentation/controllers/auth_controller.dart';
import 'package:check_maintain_frontend/presentation/controllers/device_controller.dart';
import 'package:check_maintain_frontend/presentation/controllers/dl_register_controller.dart';
import 'package:check_maintain_frontend/presentation/controllers/new_file_register_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/url_strategy.dart';


void main() async {
  usePathUrlStrategy();
  await Environment.initEnvironment();
  Get.put(AuthController());
  Get.lazyPut(() => DeviceController());
  Get.lazyPut(() => DLRegisterController());
  Get.lazyPut(() => NewFileRegisterFormController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Check Maintainer',
      theme: AppTheme().getTheme(),
    ); 
  }
}
