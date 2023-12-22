import 'dart:typed_data';

import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/presentation/controllers/dl_register_controller.dart';
import 'package:get/get.dart';

class NewFileRegisterFormController extends GetxController{  

  final _device = Rxn<Device>();
  final _image = Rxn<Uint8List>();
  final _file = Rxn<Uint8List>();

  Device? get device => _device.value;
  Uint8List? get image => _image.value;
  Uint8List? get file => _file.value;

  void setDevice(Device device){
    _device.value = device;
  }

  void setImage(Uint8List image){
    _image.value = image;
  }

  void setFile(Uint8List file){
    _file.value = file;
  }

  Future<void> save() async{
    final dlRegisterController = Get.find<DLRegisterController>(); 
    await dlRegisterController.createRegisterByFiles(device!, image!, file!);
  }

  void cancel(){
    print('cancel');
  }
  void reset(){
    _device.value = null;
    _image.value = null;
    _file.value = null;
  }

  void printResult(){
    print('device: ${_device.value.runtimeType}');
    print('image: ${_image.value.runtimeType}');
    print('file: ${_file.value.runtimeType}');
  }

}