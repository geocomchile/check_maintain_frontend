import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({super.key});

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  File? _selectedFile;

      Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // setState(() {
      //   _selectedFile = File(result.files.);
      // });

      // File file = File(result.files.single.path!);
      print(result.files.first.name);
    }
  }

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
        child: const SizedBox(
          
          width: double.infinity,
          height: 200,
          child: Center(
            child: Text('Selecciona un archivo'),
          ),
        ),
      ),
    );
  }
}