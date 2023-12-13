import 'package:check_maintain_frontend/domain/entities/device.dart';

abstract class DevicesRepository {
  Future<List<Device>> getDevices();

  Future<Device> getDevice(String id);
}
