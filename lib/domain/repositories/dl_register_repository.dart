import 'dart:typed_data';

import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/domain/entities/dl_register.dart';

abstract class DLRegisterRepository {
  Future<void> createRegisterByFiles(
      Device device, Uint8List imageBin, Uint8List fileBin);
  Future<List<DlRegister>> getRegistersByDeviceId(String deviceId);

  Future<void> deleteRegisterById(String id);

  Future<DlRegister> getRegisterById(String id);
}
