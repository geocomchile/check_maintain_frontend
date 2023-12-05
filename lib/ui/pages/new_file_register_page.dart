import 'package:check_maintain_frontend/models/devices.dart';
import 'package:check_maintain_frontend/ui/widgets/forms/device_selector_widget.dart';
import 'package:check_maintain_frontend/ui/widgets/forms/file_picker_widget.dart';
import 'package:check_maintain_frontend/ui/widgets/forms/image_picker_widget.dart';
import 'package:flutter/material.dart';

class NewFileRegisterPage extends StatelessWidget {
  static const name = 'NewFileRegister';
  NewFileRegisterPage({super.key});
  final devices = [
    Device(
      id: 1,
      modelName: 'Modelo 1',
      modelTypeDevice: 'Tipo 1',
      serialNumber: '123456789',
      active: true,
      created: DateTime.now(),
      updated: DateTime.now(),
    ),
    Device(
      id: 2,
      modelName: 'Modelo 2',
      modelTypeDevice: 'Tipo 2',
      serialNumber: '987654321',
      active: true,
      created: DateTime.now(),
      updated: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New File Register'),
      ),
      body:  Column(children: [
        Row(children: [Expanded(child: DeviceSelectorWidget(devices: devices,))]),
        const Row(children: [Expanded(child: ImagePickerWidget())]),
        const Row(children: [Expanded(child: FilePickerWidget())]),
      ]),
    );
  }
}
