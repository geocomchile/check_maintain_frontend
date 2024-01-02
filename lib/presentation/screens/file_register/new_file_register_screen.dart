
import 'package:check_maintain_frontend/presentation/controllers/device_controller.dart';
import 'package:check_maintain_frontend/presentation/controllers/new_file_register_form_controller.dart';
import 'package:check_maintain_frontend/presentation/widgets/form/device_selector_widget.dart';
import 'package:check_maintain_frontend/presentation/widgets/form/file_picker_widget.dart';
import 'package:check_maintain_frontend/presentation/widgets/form/image_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class NewFileRegisterScreen extends StatefulWidget {
  static const name = 'NewFileRegister';
  const NewFileRegisterScreen({super.key});

  @override
  State<NewFileRegisterScreen> createState() => _NewFileRegisterScreenState();
}

class _NewFileRegisterScreenState extends State<NewFileRegisterScreen> {



  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    final formController = Get.find<NewFileRegisterFormController>();
    formController.reset();
  }

  @override
  Widget build(BuildContext context) {
    final devices = Get.find<DeviceController>().devices;
    final formController = Get.find<NewFileRegisterFormController>();

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
          Obx(() => ElevatedButton.icon(
              label: const Text('Guardar'), icon: const Icon(Icons.save_outlined), onPressed: formController.isChecked.value ? () {
                formController.save();

              }: null)),
          const SizedBox(width: 10),
          ElevatedButton.icon(
              label: const Text('Cancelar'), icon: const Icon(Icons.cancel_outlined), onPressed: () {
                formController.reset();
                context.go('/');

              }),
        ]),
      ]),
    );
  }
}
