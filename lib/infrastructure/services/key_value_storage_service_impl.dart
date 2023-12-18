import 'package:check_maintain_frontend/infrastructure/services/key_value_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService {
  getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await getSharedPreferences();
    return await prefs.remove(key);
  }

  @override
  Future<T?> getKeyValue<T>(String key) async {
    final prefs = await getSharedPreferences();
    switch (T) {
      case String:
        return prefs.getString(key) as T?;
      case int:
        return prefs.getInt(key) as T?;
      case double:
        return prefs.getDouble(key) as T?;
      case bool:
        return prefs.getBool(key) as T?;
      default:
        throw Exception('Type not supported');
    }
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPreferences();
    switch (T) {
      case String:
        await prefs.setString(key, value as String);
        break;
      case int:
        await prefs.setInt(key, value as int);
        break;
      case double:
        await prefs.setDouble(key, value as double);
        break;
      case bool:
        // testing vscode dart extension
        await prefs.setBool(key, value);
        break;
      default:
        throw Exception('Type not supported');
    }
  }
}
