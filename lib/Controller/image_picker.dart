import 'dart:io';

import 'package:ente/Constants/modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:palette_generator/palette_generator.dart';

class PhotoController extends GetxController {
  RxBool isCollageCreated = false.obs;
  RxList<File> selectedPhotos = <File>[].obs;
  RxList<Color> selectedColors = <Color>[].obs;
  RxList<Collage123> collages = <Collage123>[].obs;

  Future<void> selectPhotos() async {
    try {
      isCollageCreated.value = true;
      final picker = ImagePicker();
      final pickedImages = await picker.pickMultiImage();

      if (pickedImages != null) {
        selectedPhotos.clear(); // Clear the previous list of selected photos
        selectedColors.clear();

        List<File> newSelectedPhotos = [];
        for (final image in pickedImages) {
          final file = File(image.path);
          newSelectedPhotos.add(file);
          await generatePalette(file);
        }
        selectedPhotos.assignAll(newSelectedPhotos);
        collages.add(Collage123(
            images: newSelectedPhotos, backgroundColor: selectedColors[0]));
      }
    } catch (e) {
      print('Error selecting photos: $e');
    } finally {
      isCollageCreated.value = false;
    }
  }

  Future<void> generatePalette(File imageFile) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      FileImage(imageFile),
    );
    final dominantColor = paletteGenerator.dominantColor?.color ?? Colors.black;

    selectedColors.add(dominantColor);
  }
}
