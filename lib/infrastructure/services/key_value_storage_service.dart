import 'dart:ffi';

abstract class KeyValueStorageService {
Future<void> setKeyValue<T>(String key, T value);
Future<T?> getKeyValue<T>(String key);
Future<Bool> deleteKeyValue(String key);
}