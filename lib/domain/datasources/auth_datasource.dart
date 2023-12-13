import 'package:check_maintain_frontend/domain/entities/user.dart';

abstract class AuthDataSource {
  Future<User> login(String username, String password);

  Future<User> checkAuthStatus(String token);
}
