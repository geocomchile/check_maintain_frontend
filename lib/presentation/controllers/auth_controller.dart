import 'package:check_maintain_frontend/domain/entities/user.dart';
import 'package:check_maintain_frontend/infrastructure/errors/auth_errors.dart';
import 'package:check_maintain_frontend/infrastructure/repositories/auth_repository_impl.dart';
import 'package:check_maintain_frontend/infrastructure/services/key_value_storage_service_impl.dart';
import 'package:get/get.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthController extends GetxController {
  var authStatus = AuthStatus.checking.obs;
  var user = Rxn<User>();
  var errorMessage = ''.obs;
  final AuthRepositoryImpl _authRepository;
  final keyValueStorageService = KeyValueStorageServiceImpl();

  AuthController({AuthRepositoryImpl? authRepositoryImpl})
      : _authRepository = authRepositoryImpl ?? AuthRepositoryImpl() {
    checkAuthStatus();
  }

  Future<void> login(String username, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final user = await _authRepository.login(username, password);
      this.user.value = user;
      authStatus.value = AuthStatus.authenticated;
      await keyValueStorageService.setKeyValue('token', user.token);
      errorMessage.value = '';
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error desconocido');
    }
  }

  Future<void> logout(String errorMessage) async {
    await keyValueStorageService.removeKey('token');
    authStatus.value = AuthStatus.notAuthenticated;
    user.value = null;
    this.errorMessage.value = errorMessage;
  }

  Future<void> checkAuthStatus() async {
    final token = await keyValueStorageService.getKeyValue<String>('token');
    if (token == null) {
      return logout('');
    }
    try {
      final user = await _authRepository.checkAuthStatus(token);
      this.user.value = user;
      authStatus.value = AuthStatus.authenticated;
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error desconocido');
    }

  }
}
