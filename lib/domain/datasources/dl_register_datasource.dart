import 'dart:typed_data';

import 'package:check_maintain_frontend/domain/entities/device.dart';

abstract class DLRegisterDatasource {
  Future<void> createRegisterByFiles(
      Device device, Uint8List imageBin, Uint8List fileBin);
}
