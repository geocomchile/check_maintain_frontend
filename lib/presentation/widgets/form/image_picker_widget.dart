import 'dart:io';

import 'package:check_maintain_frontend/presentation/controllers/new_file_register_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart'; // Asegúrate de agregar image_picker a tus dependencias

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final formController = Get.find<NewFileRegisterFormController>();
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
        formController.setImage(_selectedImage!);

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        _pickImage();
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
            child: Text('Selecciona una imagen'),
          ),
        ),
      ),
    );
  }
}
