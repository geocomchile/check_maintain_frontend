import 'dart:typed_data';

import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/domain/repositories/dl_register_repository.dart';
import 'package:check_maintain_frontend/infrastructure/datasources/dl_register_datasource_impl.dart';
import 'package:check_maintain_frontend/infrastructure/errors/auth_errors.dart';
import 'package:check_maintain_frontend/infrastructure/repositories/dl_register_repository_impl.dart';
import 'package:check_maintain_frontend/presentation/controllers/auth_controller.dart';
import 'package:get/get.dart';

class DLRegisterController extends GetxController {
  late final String token;
  late final DLRegisterRepository _dlRegisterRepositoryImpl;

  DLRegisterController() {
    final authController = Get.find<AuthController>();
    token = authController.user.value?.token ?? '';
    _dlRegisterRepositoryImpl = DLRegisterRepositoryImpl(
        dataSource: DLRegisterDatasourceImpl(token: token));
  }

  Future<void> createRegisterByFiles(
      Device device, Uint8List imageBin, Uint8List fileBin) async {
    try {
      await _dlRegisterRepositoryImpl.createRegisterByFiles(
          device, imageBin, fileBin);
    } catch (e) {
      throw CustomError(e.toString());
    }
  }
}
