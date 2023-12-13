import 'package:check_maintain_frontend/domain/datasources/auth_datasource.dart';
import 'package:check_maintain_frontend/domain/entities/user.dart';



class AuthDataSourceImpl extends AuthDataSource{
  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> login(String username, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  
}