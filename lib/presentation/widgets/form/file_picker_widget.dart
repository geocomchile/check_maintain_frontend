import 'dart:typed_data';
import 'package:check_maintain_frontend/presentation/controllers/new_file_register_form_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({super.key});

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  Uint8List? _selectedFile;
  String? _fileName;

  Future<void> _pickFile() async {
    final formController = Get.find<NewFileRegisterFormController>();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['DAT'],
    );
    if (result != null) {
      setState(() {
        _selectedFile = result.files.first.bytes!;
        _fileName = result.files.first.name;
        formController.setFile(_selectedFile!);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final formController = Get.find<NewFileRegisterFormController>();
    if (formController.file.value ==null) {
      _selectedFile = null;
      _fileName = null;
    } else {
      _selectedFile = formController.file.value;
      _fileName = 'Archivo seleccionado';
    }}
    
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.bottomRight, // Alinea los widgets en la parte inferior derecha
      children: [
        Container(
    decoration: BoxDecoration(
      color: colors.surface,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: colors.onSurface.withOpacity(0.2),
      ),
    ),
    child: SizedBox(
      width: double.infinity,
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          (_selectedFile != null)
            ? Text(_fileName!)
            : const Text('Sube un archivo .DAT'),
                (_selectedFile != null) ? IconButton(
                  onPressed: (){
                    final formController = Get.find<NewFileRegisterFormController>();
                    formController.resetFile();
                    setState(() {
                      _selectedFile = null;
                      _fileName = null;
                    });
                  }, 
                  icon: Icon(Icons.cancel, color: colors.onSurface.withOpacity(0.7)),
                  iconSize: 35,
                ): IconButton(
                  onPressed: (){
                    _pickFile();
                  }, 
                  icon: Icon(Icons.upload_file, color: colors.onSurface.withOpacity(0.7)),
                  iconSize: 30,
                ),
        ],)
      ),
    ),
        ),
    
      ],
    );
  }
}
