import 'dart:io';

import 'package:check_maintain_frontend/config/constants/enviroment.dart';
import 'package:check_maintain_frontend/domain/datasources/dl_register_datasource.dart';
import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DLRegisterDatasourceImpl extends DLRegisterDatasource {
  final String token;
  late final Dio dio;

  DLRegisterDatasourceImpl({required this.token}) {
    dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
      ),
    );
  }
  @override
  Future<void> createRegisterByFiles(
      Device device, FileImage image, File file) async {
    final response = await dio.post('/file-register/create', data: {
      'device': device.id,
      'image': await MultipartFile.fromFile(image.file.path),
      'file': await MultipartFile.fromFile(file.path),
    });
    print(response.data);
  }
}
