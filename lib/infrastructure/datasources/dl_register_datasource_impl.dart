import 'dart:typed_data';

import 'package:check_maintain_frontend/config/constants/enviroment.dart';
import 'package:check_maintain_frontend/domain/datasources/dl_register_datasource.dart';
import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:dio/dio.dart';

class DLRegisterDatasourceImpl extends DLRegisterDatasource {
  final String token;
  late final Dio dio;

  DLRegisterDatasourceImpl({required this.token}) {
    dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Token $token',
        },
      ),
    );
  }

  @override
  Future<void> createRegisterByFiles(
      Device device, Uint8List imageBin, Uint8List fileBin) async {
    try {


      final formData = FormData.fromMap({
        'device': device.id,
        'image': MultipartFile.fromBytes(imageBin, filename: 'image.png'),
        'main_file': MultipartFile.fromBytes(fileBin, filename: 'file.DAT'),
      });

      final response = await dio.post(
        '/file-register/create',
        data: formData,
      );
      print(response.data);
    } catch (e) {
      print('Error obed');
      print(e.toString());
    }
  }
}
