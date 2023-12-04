import 'package:ecom_3/app/models/doctor.dart';
import 'package:ecom_3/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctor_detail_controller.dart';

class DoctorDetailView extends GetView<DoctorDetailController> {
  const DoctorDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var doctor = Get.arguments as Doctor?;
    return Scaffold(
        appBar: AppBar(
          title: Text(doctor?.name ?? ''),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: doctor?.id! ?? '',
              child: Image.network(
                getImageUrl(
                  doctor?.avatar,
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
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          height: 100,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => MakeAppointmentPage(doctor: doctor!),
                        arguments: doctor);
                  },
                  child: const Text(
                    'Book Appointment',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class MakeAppointmentPage extends StatelessWidget {
  final Doctor doctor;
  const MakeAppointmentPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DoctorDetailController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor.name ?? ''),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              readOnly: true,
              controller: controller.dateController,
              decoration: InputDecoration(
                  labelText: 'Booking Date',
                  hintText: 'Select your booking date',
                  border: OutlineInputBorder(),
                  disabledBorder: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 30),
                          ),
                        );
                        if (date != null) {
                          controller.dateController.text =
                              date.toString().split(' ')[0];
                        }
                      },
                      icon: Icon(Icons.calendar_month))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your booking date';
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              readOnly: true,
              controller: controller.timeController,
              decoration: InputDecoration(
                labelText: 'Booking Time',
                hintText: 'Select your booking time',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () async {
                    TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      controller.timeController.text =
                          '${time.hour}:${time.minute}';
                    }
                  },
                  icon: Icon(Icons.timer),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your experience';
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: controller.problemsController,
              decoration: const InputDecoration(
                  labelText: 'Experience',
                  hintText: 'Enter your experience',
                  border: OutlineInputBorder(),
                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Years'),
                    ],
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your experience';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
