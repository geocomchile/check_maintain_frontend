import 'package:check_maintain_frontend/config/constants/enviroment.dart';
import 'package:check_maintain_frontend/domain/datasources/devices_datasource.dart';
import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/infrastructure/errors/auth_errors.dart';
import 'package:check_maintain_frontend/infrastructure/mappers/device_mapper.dart';
import 'package:dio/dio.dart';

class DeviceDataSourceImpl extends DevicesDataSource {
  final String token;
  late final Dio dio;

  DeviceDataSourceImpl({required this.token}) {
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
  Future<Device> getDevice(String id) async {
    try {
      final response = await dio.get('/device/$id/');
      return DeviceMapper.deviceJsonToEntity(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw CustomError(
            e.response?.data['detail'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      if (e.type == DioExceptionType.connectionError) {
        throw CustomError(e.response?.data['detail'] ?? 'Error desconocido');
      }
      throw Exception();
    } catch (e) {
      throw CustomError('Error desconocido');
    }
  }

  @override
  Future<List<Device>> getDevices() async {
    try {

      final response = await dio.get('/devices/');
      final devices = response.data as List;
      return devices.map((device) => DeviceMapper.deviceJsonToEntity(device)).toList();

    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw CustomError(
            e.response?.data['detail'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      throw CustomError('Error desconocido');
    }

  }
}