import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/infrastructure/datasources/device_datasource_impl.dart';
import 'package:check_maintain_frontend/infrastructure/repositories/device_repository_impl.dart';
import 'package:check_maintain_frontend/presentation/controllers/auth_controller.dart';
import 'package:get/get.dart';

class DeviceController extends GetxController{
  late final String token;
  final devices = List<Device>.empty().obs;
  late final DevicesRepositoryImpl _devicesRepositoryImpl;

  DeviceController(){
    final authController = Get.find<AuthController>();
    token = authController.user.value?.token ?? '';
    _devicesRepositoryImpl = DevicesRepositoryImpl(dataSource: DeviceDataSourceImpl(token: token));
  }

    Future<void> getDevices() async{
    try{
      final devices = await _devicesRepositoryImpl.getDevices();
      this.devices.value = devices;
    }catch(e){
      throw Exception();
    }
  }

  Future<Device> getDevice(String id) async{
    try{
      return await _devicesRepositoryImpl.getDevice(id);
    }catch(e){
      throw Exception();
    }



  }}




