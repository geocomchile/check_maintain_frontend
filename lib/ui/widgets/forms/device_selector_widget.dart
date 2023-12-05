import 'package:check_maintain_frontend/models/devices.dart';
import 'package:flutter/material.dart';

class DeviceSelectorWidget extends StatefulWidget {
  final List<Device> devices;

  const DeviceSelectorWidget({super.key, required this.devices});

  @override
  State<DeviceSelectorWidget> createState() => _DeviceSelectorWidgetState();
}

class _DeviceSelectorWidgetState extends State<DeviceSelectorWidget> {
    Device? selectedDevice;
  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField(
      value: selectedDevice,
      hint: const Text('Selecciona un dispositivo'),
      onChanged: (Device? newValue) {
        setState(() {
          selectedDevice = newValue;
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