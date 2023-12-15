import 'package:check_maintain_frontend/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutScreen extends StatelessWidget {
  static const name = 'logout';
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          controller.logout('');

        }, child: const Text('Logout')),
      ),
    );
  }
}
