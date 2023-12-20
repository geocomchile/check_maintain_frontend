import 'dart:io';
import 'dart:typed_data';
import 'package:check_maintain_frontend/config/constants/enviroment.dart';
import 'package:check_maintain_frontend/domain/datasources/dl_register_datasource.dart';
import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/infrastructure/errors/auth_errors.dart';
import 'package:dio/dio.dart';

class DLRegisterDatasourceImpl extends DLRegisterDatasource {
  final String token;
  late final Dio dio;

  DLRegisterDatasourceImpl({required this.token}) {
    dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
      ),
    );
  }

  @override
  Future<void> createRegisterByFiles(Device device, File image, File file) async {
    try {


      final response = await dio.post(
        '/file-register/create',
        data: {
          'device': device.id,
          'image':  image.readAsBytes().toString(),
          'main_file':  file.readAsBytes().toString(),
        },
        );
      print(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(
            e.response?.data ?? 'Credenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();
    }
    
    catch (e) {
      print('Error obed');
      print(e.toString());

    }
  }
}

