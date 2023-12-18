import 'package:check_maintain_frontend/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRouterNotifier extends ChangeNotifier {
  final AuthController _authController;

  AppRouterNotifier(this._authController) {
    ever(_authController.authStatus, (status) {
      notifyListeners();
    });
  }
}
