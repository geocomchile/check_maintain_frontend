import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/presentation/controllers/new_file_register_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceSelectorWidget extends StatefulWidget {
  final List<Device> devices;

  const DeviceSelectorWidget({super.key, required this.devices});

  @override
  State<DeviceSelectorWidget> createState() => _DeviceSelectorWidgetState();
}

class _DeviceSelectorWidgetState extends State<DeviceSelectorWidget> {
    Device? selectedDevice;

  @override
  void initState() {
    super.initState();
    final formController = Get.find<NewFileRegisterFormController>();
    selectedDevice = formController.device;
  }

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<NewFileRegisterFormController>();

    return  DropdownButtonFormField(
      value: selectedDevice,
      hint: const Text('Selecciona un dispositivo'),
      onChanged: (Device? newValue) {
        setState(() {
          selectedDevice = newValue;
          formController.setDevice(newValue!);
        });
      },
      items: widget.devices.map<DropdownMenuItem<Device>>((Device value) {
        return DropdownMenuItem<Device>(
          value: value,
          child: Row(
            children: [
              Text(value.serialNumber),
              const SizedBox(width: 10),
              Text(value.modelName),
            ],
          ),
        );
      }).toList(),
    );
  }
}