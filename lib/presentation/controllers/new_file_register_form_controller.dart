import 'dart:typed_data';

import 'package:check_maintain_frontend/config/router/app_router.dart';
import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/presentation/controllers/dl_register_controller.dart';
import 'package:get/get.dart';

class NewFileRegisterFormController extends GetxController {
  final device = Rxn<Device>();
  final image = Rxn<Uint8List>();
  final file = Rxn<Uint8List>();

  void setDevice(Device device) {
    this.device.value = device;
  }

  void setImage(Uint8List image) {
    this.image.value = image;
  }

  void setFile(Uint8List file) {
    this.file.value = file;
  }

  Future<void> save() async {
    final dlRegisterController = Get.find<DLRegisterController>();
    await dlRegisterController.createRegisterByFiles(
        device.value!, image.value!, file.value!);
    appRouter.go('/');
  }

  void cancel() {
    print('cancel');
  }

  void reset() {
    device.value = null;
    image.value = null;
    file.value = null;
  }

  void printResult() {
    print('device: ${device.value.runtimeType}');
    print('image: ${image.value.runtimeType}');
    print('file: ${file.value.runtimeType}');
  }
}
