import 'package:check_maintain_frontend/presentation/widgets/charts/collimation_error_chart.dart';
import 'package:flutter/material.dart';

class DeviceScreen extends StatefulWidget {
  static const String name = 'device-screen';
  const DeviceScreen({super.key, required this.idDevice});

  final String idDevice;

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: CollimationErrorChart(),
      ),
    );
  }
}
