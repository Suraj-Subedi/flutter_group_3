import 'package:ecom_3/app/models/doctor.dart';
import 'package:ecom_3/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctor_detail_controller.dart';

class DoctorDetailView extends GetView<DoctorDetailController> {
  const DoctorDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var doctor = Get.arguments as Doctor;
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor.name ?? ''),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Hero(
            tag: doctor.id!,
            child: Image.network(
              getImageUrl(
                doctor.avatar,
              ),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(),
        ),
      ]),
    );
  }
}
