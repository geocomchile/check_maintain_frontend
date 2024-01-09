import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/domain/repositories/devices_repository.dart';
import 'package:check_maintain_frontend/domain/datasources/devices_datasource.dart';

class DevicesRepositoryImpl extends DevicesRepository {
  final DevicesDataSource dataSource;

  DevicesRepositoryImpl({required this.dataSource});

  @override
  Future<Device> getDevice(String id) async {
    return dataSource.getDevice(id);
  }

  @override
  Future<List<Device>> getDevices() async {
    return dataSource.getDevices();
  }
}
