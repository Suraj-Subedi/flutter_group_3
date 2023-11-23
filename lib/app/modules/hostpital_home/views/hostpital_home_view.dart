import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hostpital_home_controller.dart';

class HostpitalHomeView extends GetView<HostpitalHomeController> {
  const HostpitalHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hostpital'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HostpitalHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
