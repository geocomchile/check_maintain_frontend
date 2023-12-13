import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/presentation/widgets/share/custom_button.dart';
import 'package:check_maintain_frontend/presentation/widgets/form/device_selector_widget.dart';
import 'package:check_maintain_frontend/presentation/widgets/form/file_picker_widget.dart';
import 'package:check_maintain_frontend/presentation/widgets/form/image_picker_widget.dart';
import 'package:flutter/material.dart';

class NewFileRegisterScreen extends StatelessWidget {
  static const name = 'NewFileRegister';
  NewFileRegisterScreen({super.key});
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
      body: Column(children: [
        Row(children: [
          Expanded(
              child: DeviceSelectorWidget(
            devices: devices,
          ))
        ]),
        const Row(children: [Expanded(child: ImagePickerWidget())]),
        const Row(children: [Expanded(child: FilePickerWidget())]),
        Row(children: [
          CustomButton(title: 'Guardar', icon: Icons.save_outlined, onPressed: () {}),
          const SizedBox(width: 10),
          CustomButton(
              title: 'Cancelar', icon: Icons.cancel_outlined, onPressed: () {}),
        ]),
      ]),
    );
  }
}
