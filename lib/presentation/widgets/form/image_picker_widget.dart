import 'dart:typed_data';

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
  Uint8List? _selectedImage;

  Future<void> _pickImage() async {
    final formController = Get.find<NewFileRegisterFormController>();
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final imageData = await image.readAsBytes();

      setState(() {
        _selectedImage = imageData;
        formController.setImage(_selectedImage!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DecoratedBox(
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Muestra la imagen seleccionada
            if (_selectedImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.memory(
                  _selectedImage!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            // Muestra el texto y el botón
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: (_selectedImage == null)
                  ? [
                      const Text('Sube una imagen'),
                      IconButton(
                        onPressed: _pickImage,
                        icon: Icon(Icons.add_a_photo,
                            size: 30, color: colors.onSurface.withOpacity(0.7)),
                      )
                    ]
                  : [
                      Container(
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                final formController =
                                    Get.find<NewFileRegisterFormController>();
                                formController.resetImage();
                                setState(() {
                                  _selectedImage = null;
                                });
                              },
                              icon: Icon(
                                Icons.cancel,
                                size: 35,
                                color: colors.onSurface.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
            ),
          ],
        ),
      ),
    );
  }
}
