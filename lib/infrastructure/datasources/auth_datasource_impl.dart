import 'package:check_maintain_frontend/config/constants/enviroment.dart';
import 'package:check_maintain_frontend/domain/datasources/auth_datasource.dart';
import 'package:check_maintain_frontend/domain/entities/user.dart';
import 'package:check_maintain_frontend/infrastructure/errors/auth_errors.dart';
import 'package:check_maintain_frontend/infrastructure/mappers/user_mapper.dart';
import 'package:dio/dio.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
    ),
  );

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get('/api-token-auth-verify',
          options: Options(
            headers: {
              'Authorization': 'Token $token',
            },
          ));
      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e){
      if (e.response?.statusCode == 400) {
        throw CustomError(
            e.response?.data['error'] ?? 'Invalid or missing token');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();

    }catch (e) {
      throw CustomError('Error desconocido');
    }
  }

  @override
  Future<User> login(String username, String password) async {
    try {
      final response = await dio.post(
        '/api-token-auth/',
        data: {
          'username': username,
          'password': password,
        },
      );
      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(
            e.response?.data['non_field_errors'] ?? 'Credenciales incorrectas');
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
