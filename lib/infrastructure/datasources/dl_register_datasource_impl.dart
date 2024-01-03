import 'dart:typed_data';

import 'package:check_maintain_frontend/config/constants/enviroment.dart';
import 'package:check_maintain_frontend/domain/datasources/dl_register_datasource.dart';
import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/domain/entities/dl_register.dart';
import 'package:check_maintain_frontend/infrastructure/errors/auth_errors.dart';
import 'package:check_maintain_frontend/infrastructure/mappers/dl_register_mapper.dart';
import 'package:dio/dio.dart';

class DLRegisterDatasourceImpl extends DLRegisterDatasource {
  final String token;
  late final Dio dio;

  DLRegisterDatasourceImpl({required this.token}) {
    dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
        headers: {
          //'Content-Type': 'multipart/form-data',
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

      await dio.post(
        '/file-register/create',
        data: formData,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(
            e.response?.data['error'] ?? 'Invalid or missing token');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
    } catch (e) {
      throw CustomError('Error desconocido');
    }
  }

  @override
  Future<List<DlRegister>> getRegistersByDeviceId(String deviceId) async {
    try {
      final response = await dio.get('/dl-registers/$deviceId');

      final dlRegisters = (response.data as List)
          .map((e) => DlRegisterMapper.dlRegisterJsonToEntity(e))
          .toList();

      return dlRegisters;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(
            e.response?.data['error'] ?? 'Invalid or missing token');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteRegisterById(String id) async {
    try {
      final response = await dio.delete('/dl-register/$id');

      print(response.statusCode);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(
            e.response?.data['error'] ?? 'Invalid or missing token');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DlRegister> getRegisterById(String id) async {
    try {
      final response = await dio.get('/dl-register/$id');

      final dlRegister = DlRegisterMapper.dlRegisterJsonToEntity(response.data);

      return dlRegister;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(
            e.response?.data['error'] ?? 'Invalid or missing token');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      if (e.response?.statusCode == 404) {
        throw CustomError(e.response?.data['error'] ?? '404 Not Found');
      }

      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
