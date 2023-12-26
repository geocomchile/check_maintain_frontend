// ignore_for_file: prefer_const_constructors

import 'package:check_maintain_frontend/presentation/widgets/charts/collimation_error_chart.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CollimationErrorChart(),
      ),
    );
  }
}
