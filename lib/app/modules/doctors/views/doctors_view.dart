import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctors_controller.dart';

class DoctorsView extends GetView<DoctorsController> {
  const DoctorsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoctorsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DoctorsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
