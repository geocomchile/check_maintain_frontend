import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  static const name = 'logout';
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: const Center(
        child: Text('Logout '),
      ),
    );
  }
}