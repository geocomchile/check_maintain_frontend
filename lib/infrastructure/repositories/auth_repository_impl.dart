import 'package:check_maintain_frontend/domain/datasources/auth_datasource.dart';
import 'package:check_maintain_frontend/domain/entities/user.dart';
import 'package:check_maintain_frontend/domain/repositories/auth_repository.dart';
import 'package:check_maintain_frontend/infrastructure/datasources/auth_datasource_impl.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({
    AuthDataSource? dataSource,
}) : dataSource = dataSource ?? AuthDataSourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return dataSource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String username, String password) {
    return dataSource.login(username, password);
  }
}
