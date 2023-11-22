import 'package:ecom_3/app/routes/app_pages.dart';
import 'package:ecom_3/app/utils/memory.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_main_controller.dart';

class AdminMainView extends GetView<AdminMainController> {
  const AdminMainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminMainView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await Memory.clear();
                Get.offAllNamed(Routes.LOGIN);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text(
          'AdminMainView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
