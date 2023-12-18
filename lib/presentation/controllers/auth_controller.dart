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
  final AuthRepositoryImpl _authRepositoryImpl;
  final keyValueStorageService = KeyValueStorageServiceImpl();

  AuthController({AuthRepositoryImpl? authRepositoryImpl})
    : _authRepositoryImpl = authRepositoryImpl ?? AuthRepositoryImpl();


  void login(String username, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final user = await _authRepositoryImpl.login(username, password);
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

  void logout(String errorMessage) async {
    authStatus.value = AuthStatus.notAuthenticated;
    await keyValueStorageService.deleteKeyValue('token');
    user.value = null;
    this.errorMessage.value = errorMessage;

  }
}

