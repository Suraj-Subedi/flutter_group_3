import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hospital_main_controller.dart';

class HospitalMainView extends GetView<HospitalMainController> {
  const HospitalMainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HospitalMainView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HospitalMainView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
