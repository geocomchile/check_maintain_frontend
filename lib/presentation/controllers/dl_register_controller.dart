import 'dart:typed_data';

import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/domain/entities/dl_register.dart';
import 'package:check_maintain_frontend/domain/repositories/dl_register_repository.dart';
import 'package:check_maintain_frontend/infrastructure/datasources/dl_register_datasource_impl.dart';
import 'package:check_maintain_frontend/infrastructure/errors/auth_errors.dart';
import 'package:check_maintain_frontend/infrastructure/repositories/dl_register_repository_impl.dart';
import 'package:check_maintain_frontend/presentation/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:check_maintain_frontend/config/router/app_router.dart';

class DLRegisterController extends GetxController {
  late final String token;
  late final DLRegisterRepository _dlRegisterRepositoryImpl;
  var indexBottomNavigationBar = 0.obs;
  

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

  Future<void> deleteRegisterById(String idRegister) async {
    try {
      await _dlRegisterRepositoryImpl.deleteRegisterById(idRegister);
      appRouter.go('/');
    } catch (e) {
      throw CustomError(e.toString());
    }
  }

  Future<List<DlRegister>> getRegistersByDeviceId(String deviceId) async {
    try {
      return await _dlRegisterRepositoryImpl.getRegistersByDeviceId(deviceId);
    } catch (e) {
      throw CustomError(e.toString());
    }
  }

  Future<DlRegister> getRegisterById(String idRegister) async{
        try {
      return await _dlRegisterRepositoryImpl.getRegisterById(idRegister);
    } catch (e) {
      throw CustomError(e.toString());
    }

  }
}
