import 'package:check_maintain_frontend/domain/datasources/dl_register_datasource.dart';
import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/domain/repositories/dl_register_repository.dart';

class DLRegisterRepositoryImpl extends DLRegisterRepository {
  final DLRegisterDatasource dataSource;

  DLRegisterRepositoryImpl({required this.dataSource});

  @override
  Future<void> createRegisterByFiles(
      Device device, dynamic image, dynamic file) async{
    return await dataSource.createRegisterByFiles(device, image, file);
  }
}
