import 'dart:typed_data';

import 'package:check_maintain_frontend/domain/datasources/dl_register_datasource.dart';
import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/domain/entities/dl_register.dart';
import 'package:check_maintain_frontend/domain/repositories/dl_register_repository.dart';

class DLRegisterRepositoryImpl extends DLRegisterRepository {
  final DLRegisterDatasource dataSource;

  DLRegisterRepositoryImpl({required this.dataSource});

  @override
  Future<void> createRegisterByFiles(
      Device device, Uint8List imageBin, Uint8List fileBin) async {
    return await dataSource.createRegisterByFiles(device, imageBin, fileBin);
  }

  @override
  Future<List<DlRegister>> getRegistersByDeviceId(String deviceId) async {
    return await dataSource.getRegistersByDeviceId(deviceId);
  }
  
  @override
  Future<void> deleteRegisterById(String id) {
    return dataSource.deleteRegisterById(id);
  }
  
  @override
  Future<DlRegister> getRegisterById(String id) {
    return dataSource.getRegisterById(id);
  }
}
