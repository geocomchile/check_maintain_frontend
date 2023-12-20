import 'dart:io';

import 'package:check_maintain_frontend/domain/entities/device.dart';


abstract class DLRegisterRepository{
  Future<void> createRegisterByFiles(Device device, File image, File file);

}