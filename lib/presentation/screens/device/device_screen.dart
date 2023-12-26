// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DeviceScreen extends StatelessWidget {
  static const String name = 'device-screen';
  const DeviceScreen({super.key, required this.idDevice});

  final String idDevice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device'),
      ),
      body: Center(
        child: Text('Device $idDevice'),
      ),
    );
  }
}
