import 'package:ecom_3/app/modules/home/controllers/home_controller.dart';
import 'package:ecom_3/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctors_controller.dart';

class DoctorsView extends GetView<DoctorsController> {
  const DoctorsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DoctorsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Doctors'),
          centerTitle: true,
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            if (controller.doctorsResponse == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: controller.doctorsResponse?.doctors?.length,
                itemBuilder: (context, index) {
                  var doctor = controller.doctorsResponse!.doctors![index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          getImageUrl(doctor.avatar),
                          width: 100,
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          height: 75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    (doctor.name ?? ''),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    doctor.isDeleted == '1' ? ' (Deleted)' : '',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                doctor.title ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                doctor.consultationCharge ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: doctor.isDeleted == '1'
                              ? const Icon(
                                  Icons.restore,
                                  color: Colors.green,
                                )
                              : const Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const AddDoctorPopup();
                });
          },
          child: const Icon(Icons.add),
        ));
  }
}

class AddDoctorPopup extends StatelessWidget {
  const AddDoctorPopup({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DoctorsController>();
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Doctor'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.doctorNameController,
                    decoration: const InputDecoration(
                      labelText: 'Doctor Name',
                      hintText: 'Enter your doctor name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your doctor name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.chargeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Consultation Charge',
                      hintText: 'Enter your consultation charge',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your consultation charge';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.experienceController,
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
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<HomeController>(
                    builder: (homeController) {
                      if (homeController.specializationResponse == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return DropdownButtonFormField<String>(
                        items: homeController
                            .specializationResponse!.specalizations!
                            .map((e) => DropdownMenuItem(
                                  value: e.specializationId.toString(),
                                  child: Text(e.title ?? ''),
                                ))
                            .toList(),

                        // items: [
                        //   DropdownMenuItem(
                        //     child: Text('Admin'),
                        //     value: 'admin',
                        //   ),
                        //   DropdownMenuItem(
                        //     child: Text('Hospital'),
                        //     value: 'hospital',
                        //   ),
                        // ],

                        onChanged: (v) {
                          controller.specializationId = v;
                          controller.update();
                        },
                        value: controller.specializationId,
                        decoration: const InputDecoration(
                          labelText: 'Specialization',
                          hintText: 'Select doctor specialization',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select doctor specialization';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<DoctorsController>(
                    builder: (controller) => (controller.image == null ||
                            controller.imageBytes == null)
                        ? ElevatedButton(
                            onPressed: controller.pickImage,
                            child: const Text('Upload Image'),
                          )
                        : Stack(
                            children: [
                              Image.memory(
                                controller.imageBytes!,
                                height: 300,
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      controller.image = null;
                                      controller.imageBytes = null;
                                      controller.update();
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: controller.addDoctor,
                    child: const Text('Add Doctor'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
