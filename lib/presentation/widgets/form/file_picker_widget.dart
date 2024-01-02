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
    return InkWell(
      onTap: () {
        _pickFile();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: colors.onSurface.withOpacity(0.12),
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: Center(
            child: (_selectedFile != null)
                ? Text(_fileName!)
                : const Text('Selecciona un archivo .DAT'),
          ),
        ),
      ),
    );
  }
}
