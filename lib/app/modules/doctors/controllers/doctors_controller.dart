import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DoctorsController extends GetxController {
  var doctorNameController = TextEditingController();
  var chargeController = TextEditingController();
  var experienceController = TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? image;
  Uint8List? imageBytes;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void pickImage() async {
    try {
      image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      imageBytes = (await image!.readAsBytes());
      update();
    } catch (e) {}
  }
}
