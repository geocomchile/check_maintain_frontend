import 'dart:io';

import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:get/get.dart';

class NewFileRegisterFormController extends GetxController{

  final _device = Rxn<Device>();
  final _image = Rxn<File>();
  final _file = Rxn<File>();

  Device? get device => _device.value;
  File? get image => _image.value;
  File? get file => _file.value;

  void setDevice(Device device){
    _device.value = device;
  }

  void setImage(File image){
    _image.value = image;
  }

  void setFile(File file){
    _file.value = file;
  }

  void save(){
    print('save');
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
    print('device: ${_device.value}');
    print('image: ${_image.value}');
    print('file: ${_file.value}');
  }

}