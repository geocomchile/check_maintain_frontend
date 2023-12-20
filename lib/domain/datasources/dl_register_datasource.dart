import 'package:check_maintain_frontend/domain/entities/device.dart';


abstract class DLRegisterDatasource{
  Future<void> createRegisterByFiles(Device device, dynamic image, dynamic file);

}