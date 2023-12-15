import 'package:check_maintain_frontend/presentation/controllers/auth_controller.dart';
import 'package:check_maintain_frontend/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final AuthController controller = Get.find();
    if (controller.authStatus.value != AuthStatus.authenticated) {
      return const RouteSettings(name: '/login');
    }

    return null;
  }
}

final routes = [
  GetPage(
    name: '/',
    page: () => const HomeScreen(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(name: '/new-file-register', page: () => NewFileRegisterScreen(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/profile', page: () => const ProfileScreen(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/settings', page: () => const SettingsScreen(), middlewares: [AuthMiddleware()]),
  GetPage(name: '/logout', page: () => const LogoutScreen(), middlewares: [AuthMiddleware()]),
  GetPage(
    name: '/login',
    page: () => const LoginScreen(),
  )
];
