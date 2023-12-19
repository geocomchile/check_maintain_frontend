import 'dart:io';

import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:flutter/material.dart';

abstract class DLRegisterRepository{
  Future<void> createRegisterByFiles(Device device, FileImage image, File file);

}