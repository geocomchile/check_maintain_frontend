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
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
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
    } catch (e) {
      if (e is DioException) {
        switch (e.response?.statusCode) {
          case 400:
            throw WrongCredentials();
          case 401:
            throw InvalidToken();
          case 408:
            throw ConnectionTimeout();
          default:
            throw CustomError(e.response?.statusMessage ?? 'Unknown error');
        }
      } else {
        throw CustomError(e.toString());
      }
    }
  }
}
