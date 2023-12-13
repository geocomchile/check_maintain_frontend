import 'package:check_maintain_frontend/config/constants/enviroment.dart';
import 'package:check_maintain_frontend/config/router/app_router.dart';
import 'package:check_maintain_frontend/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  await Environment.initEnvironment();
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
