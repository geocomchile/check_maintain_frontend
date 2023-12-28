import 'package:check_maintain_frontend/presentation/controllers/dl_register_controller.dart';
import 'package:check_maintain_frontend/presentation/widgets/charts/collimation_error_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceScreen extends StatefulWidget {
  static const String name = 'device-screen';
  const DeviceScreen({super.key, required this.idDevice});

  final String idDevice;

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final dlRegisterController = Get.find<DLRegisterController>();
  @override
  void initState() {
    super.initState();
    dlRegisterController
        .getRegistersByDeviceId(widget.idDevice)
        .then((value) => print(value.first.collimationError))
        .onError((error, stackTrace) => printError(info: error.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device ${widget.idDevice}'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: CollimationErrorChart(),
      ),
    );
  }
}
