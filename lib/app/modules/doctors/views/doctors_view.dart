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
                              Text(
                                doctor.name ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
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
                        )
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
                  return AddDoctorPopup();
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
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 15,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: controller.doctorNameController,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Enter your email address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  } else if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.chargeController,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Enter your email address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  } else if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.experienceController,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Enter your email address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  } else if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<DoctorsController>(
                builder: (controller) =>
                    (controller.image == null || controller.imageBytes == null)
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
            ],
          ),
        ),
      ),
    );
  }
}
