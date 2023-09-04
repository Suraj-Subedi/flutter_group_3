import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'The count is',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Center(
                child: Text(
                  controller.count.value.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.increaseCount();
                  },
                  child: Text('Increment'),
                ),
              ),
            ],
          ),
        ));
  }
}
