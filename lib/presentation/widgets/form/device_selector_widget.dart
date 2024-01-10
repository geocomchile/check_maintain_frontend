import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/presentation/controllers/device_controller.dart';
import 'package:check_maintain_frontend/presentation/controllers/new_file_register_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceSelectorWidget extends StatefulWidget {

  const DeviceSelectorWidget({super.key});

  @override
  State<DeviceSelectorWidget> createState() => _DeviceSelectorWidgetState();
}

class _DeviceSelectorWidgetState extends State<DeviceSelectorWidget> {
  Device? selectedDevice;
  List<Device> devices = [];
  int? index;
  

  

@override
void initState() {
  super.initState();
  final deviceController = Get.find<DeviceController>();
  deviceController.getDevices();
  devices = deviceController.devices;
  index = deviceController.index.value;

}




  @override
  Widget build(BuildContext context) {
    final deviceController = Get.find<DeviceController>();
    final formController = Get.find<NewFileRegisterFormController>();
    final colors = Theme.of(context).colorScheme;

    return Obx(() =>  DropdownButtonFormField(
      borderRadius: BorderRadius.circular(10),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                      colors.primary) // Puedes ajustar el radio del borde aquí
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      // focusColor: Colors.green,
      // iconEnabledColor: Colors.green,
      value: (index != null) ? devices[index!] : null,
      hint: const Text('Selecciona un dispositivo'),
      onChanged: (Device? newValue) {
        setState(() {
          // selectedDevice = newValue;
          formController.setDevice(newValue!);
          deviceController.index.value = devices.indexOf(newValue);
        });
      },
      items: devices.map<DropdownMenuItem<Device>>((Device value) {
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
    ));
  }
}
